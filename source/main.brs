sub main(obj)
    ? obj
    app_info = CreateObject("roAppInfo")
    ? "App Title: ", app_info.getTitle()
    ? "App Version: ", app_info.getVersion()
    ? "Channel ID: ", app_info.getId()
    ? "Is Dev: ", app_info.isDev()
    ? "- - - - - - - - - - - - - - - - - -"
    device_info = CreateObject("roDeviceInfo")
    ? "Model: ", device_info.getModel()
    ? "Display Name: ", device_info.getModelDisplayName()
    ? "Firmware: ", device_info.getVersion()
    ? "Device ID: ", device_info.getChannelClientId()
    ? "Friendly Name: ", device_info.getFriendlyName()
    display_size = device_info.getDisplaySize()
    display_res = device_info.getUIResolution()
    ? "Display Size: ", display_size.w; "x"; display_size.h
    ? "UI Resolution: ", display_res.name
    ? "Video Mode: ", device_info.getVideoMode()
    ? "IP Address", device_info.getExternalIp()

    m.port = CreateObject("roMessagePort")
    screen = CreateObject("roSGScreen")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("home_scene")
    'Conditional backround render based on device resolution'
    if display_res.name = "FHD" then
        scene.backgroundUri = "pkg:/images/background_fhd.png"
    else if display_res.name = "HD" then
        scene.backgroundUri = "pkg:/images/background_hd.png"
    else if display_res.name = "SD" then
        scene.backgroundUri = "pkg:/images/background_sd.png"
    end if
    screen.Show()

    while(true)

    end while
end sub