sub main()
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
    ? "Display Size: ", display_size.w; "x"; display_size.h
    ? "UI Resolution: ", device_info.getUIResolution()
    ? "Video Mode: ", device_info.getVideoMode()
    ? "IP Address", device_info.getExternalIp()
end sub