sub init()
    m.top.functionname = "request"
    m.top.response = ""
end sub

function request()
    filePath = m.top.path
    ? "Content Task File Path: ";filePath

    'Read JSON data from file
    jsonFile = ReadAsciiFile(filePath)

    if jsonFile <> invalid
        'Parse and handle JSON data here


        ? "JSON Data: "; jsonFile
        m.top.response = jsonFile
    else
        'Handle file read failure
        ? "Failed to read JSON file."
        m.top.response = "test."
        m.top.response = "Failed to read JSON file"
    end if
end function