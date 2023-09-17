function init()
    m.top.functionname = "request"
    m.top.response = ""
    m.top.response_two = ""
end function

function request()
    'Locate weather_screen component
    url = "https://api.weather.gov/gridpoints/GJT/121,164/forecast"
    'Define the weather API URL

    'Message port for handling requests
    req = CreateObject("roUrlTransfer")
    req.RetainBodyOnError(true)
    port = CreateObject("roMessagePort")

    'Set message port
    req.SetMessagePort(port)

    'Specify the path to the certificate file (.crt) that includes CA certificates
    certificateFilePath = "pkg:/certificates/my_certs.crt"

    'Set the certificates file
    req.SetCertificatesFile(certificateFilePath)
    req.InitClientCertificates()
    req.enablehostverification(false)
    req.enablepeerverification(false)

    'Make request
    req.SetURL(url)
    if req.AsyncGetToString() then 'Check if data is returned
        msg = wait(10000, port)
        if (type(msg) = "roUrlEvent")
            if (msg.getresponsecode() > 0 and msg.getresponsecode() < 400)
                'Parse response

                weatherData = ParseJSON(msg.getstring())
                dayData = weatherData["properties"]["periods"]
                'Extract temp information
                if weatherData <> invalid and dayData <> invalid
                    firstPeriod = weatherData["properties"]["periods"][0]

                    'Check if temperature field is availiable
                    if firstPeriod <> invalid and firstPeriod["temperature"] <> invalid
                        'Access the temperature value and unit
                        temperature = firstPeriod["temperature"]
                        temperatureUnit = firstPeriod["temperatureUnit"]

                        'Turn temerature to string to allow concatinization
                        temperatureString = Str(temperature)
                        'Update label

                        weekData = ""
                        for i = 2 to 10 step 2
                            weekData = weekData + "|" + dayData[i]["name"] + Str(dayData[i]["temperature"]) + "F"
                        end for
                        m.top.response = "Current Tempurature: " + temperatureString + temperatureUnit
                        m.top.response_two = weekData
                    else
                        ? "Invalid or missing temperature data in the response."
                    end if
                end if
            end if
        end if
    end if
end function

