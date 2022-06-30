module scraper

using HTTP # for http requests.
using Gumbo # to parse the downloaded source code into a hierarchical structured object.
using Cascadia # to scrape using a CSS selector API.

include("exams.jl")
include("db.jl")

export generateData, generateAllData

end # module