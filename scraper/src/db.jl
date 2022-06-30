using MySQL

function getConnection(bachelor::Bool=true)::MySQL.Connection
    host = "127.0.0.1"
    user = "informatica"
    password = "mu99Db6JWwWXAeLK"
    db = bachelor ? "informatica_triennale" : "informatica_magistrale"
    DBInterface.connect(MySQL.Connection, host, user, password, db=db)
end

function executeQuery(conn::MySQL.Connection, query::AbstractString)::MySQL.TextCursor
    DBInterface.execute(conn, query)
end