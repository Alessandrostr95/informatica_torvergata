sessions = Dict(
    "invernale" => 0,
    "estiva anticipata" => 1,
    "estiva" => 3,
    "autunnale" => 5
)

"""
    Estrapola gli elementi `table` dalla pagina del corso.
    Argomenti:
    - `session`::AbstractString = sessione ["invernale", "estiva anticipata", "estiva", "autunnale"]. Defaul "estiva".
    - `bachelor`::Bool = se "true" sta ad indicare il contesto della laurea triennale. Laurea magistrale altrimenti. Defaul "true".
"""
function fetchTables(session::AbstractString="estiva", bachelor::Bool=true)
    course = bachelor ? "trien" : "magis"
    url = "http://www.informatica.uniroma2.it/pages/$course/esami/dateEsami$(sessions[lowercase(session)]).htm"
    req = HTTP.get(url)
    req.status ≠ 200 && error("Rsponse status $(req.status).")
    
    page = parsehtml(String(req))
    
    tables = eachmatch(sel"table tbody", page.root)
    tables
end

mutable struct ExamInfo
    Date::String
    Hour::String
    Room::String
end

mutable struct Exam
    ClassName::String
    Code::String
    Teacher::String
    Session::String
    Call::Int
    Writing::ExamInfo
    Oral::ExamInfo

    function Exam(;className, code, teacher, session, call, writing, oral)
        new(className, code, teacher, session, call, writing, oral)
    end
end

"""
    Funzione che 'pulisce' i vari campi della tabella da eventuali **obrabri** (come i campi "null" ...)
"""
function clearField(s::AbstractString)::String
    result = strip(s)
    lowercase(result) == "null" && return ""
    result
end

"""
    Funzione che ritorna il campo testo di un HTMLElement
"""
getText(e::HTMLElement)::String = length(e.children) == 0 ? "" : first(e.children).text |> clearField

getCode(href::AbstractString)::String = Base.match(r"id=[A-Z0-9]+$", href).match[4:end] |> string

"""
    Funzione che converte una stringa nel formato "DD-MM-YYYY" nel formato internazionale "YYYY-MM-DD".
"""
parseDate(s::AbstractString)::String = split(s, "-") |> (x -> join(reverse(x), "-"))

"""
    Ritorna un vettore di struct `Exam`.
    Args:
    - `session`::AbstractString = sessione ["invernale", "estiva anticipata", "estiva", "autunnale"]. Defaul "estiva".
    - `bachelor`::Bool = se "true" sta ad indicare il contesto della laurea triennale. Laurea magistrale altrimenti. Defaul "true".
"""
function scrapeExams(session::AbstractString="estiva", bachelor::Bool=true)::Vector{Exam}
    tables = fetchTables(session, bachelor)
    table_rows = Exam[]
    
    for i = 1:length(tables)
        table = tables[i]
        rows = [eachmatch(sel"tr#row-0-color", table); eachmatch(sel"tr#row-1-color", table)]
        for r ∈ rows
            class = first(eachmatch(sel"a", r.children[1]))
            class_name = first(class.children).text |> clearField
            href = class.attributes["href"] |> clearField
            code = getCode(href)
            teacher = r.children[2] |> getText
            scritto = ExamInfo(getText.(r.children[3:5])...)
            orale = ExamInfo(getText.(r.children[6:8])...)
            exam = Exam(;
                className = class_name,
                code = code,
                teacher = teacher,
                writing = scritto,
                oral = orale,
                session = session,
                call = i
            )
    
            push!(table_rows, exam)
        end
    end
    table_rows
end

"""
    Estrapola gli esami dal stio di informatica e genera i rispettivi record nel database.
    Args:
    - `year`::AbstractString = anno accademico. Default "21-22".
    - `session`::AbstractString = sessione ["invernale", "estiva anticipata", "estiva", "autunnale"]. Defaul "estiva".
    - `bachelor`::Bool = se "true" sta ad indicare il contesto della laurea triennale. Laurea magistrale altrimenti. Defaul "true".
"""
function generateData(year::AbstractString="21-22", session::AbstractString="estiva", bachelor::Bool=true)
    table_rows::Vector{Exam} = scrapeExams(session, bachelor)
    
    query = """insert into exam (`class`, `year`, `session`, `call`, `type`, `date`, `hour`, `room`)\nvalues"""
    for exam ∈ table_rows
        query = query * """ ('$(exam.Code)', '$year', '$session', $(exam.Call), 'scritto',  $(exam.Writing.Date ≠ "" ? "'" * parseDate(exam.Writing.Date) * "'"  : "NULL"), $(exam.Writing.Hour ≠ "" ? "'" * exam.Writing.Hour * ":00'" : "NULL"), '$(exam.Writing.Room)'),\n"""
        query = query * """ ('$(exam.Code)', '$year', '$session', $(exam.Call), 'orale',    $(exam.Writing.Date ≠ "" ? "'" * parseDate(exam.Writing.Date) * "'"  : "NULL"), $(exam.Writing.Hour ≠ "" ? "'" * exam.Writing.Hour * ":00'" : "NULL"), '$(exam.Writing.Room)'),\n"""
    end
    query = query[begin:end-2] * ";"
    
    conn = getConnection(bachelor)  
    try
        executeQuery(conn, query)
        DBInterface.close!(conn)

        println("Insert done: year=$year session=$session bachelor=$bachelor")
    catch e
        println("Insert error: year=$year session=$session bachelor=$bachelor")
        println(conn)
        println(query)
        throw(e)
    end
end

function generateAllData(year::AbstractString="21-22")
    for session ∈ ["invernale", "estiva anticipata", "estiva", "autunnale"]
        generateData(year, session) # bachelor
        generateData(year, session, false) # master
    end
end