function init()
    ? "[weather_screen] init"
    m.tempLabel = m.top.findNode("temp_label")
    m.weekLabel = m.top.findNode("weekly_label")
    loadTemp()
end function

sub loadTemp()
    m.task = CreateObject("roSGNode", "weather_task")
    m.task.observeField("response", "onTempResponse")
    m.task.observeField("response_two", "onWeekTempResponse")
    m.task.control = "RUN"
end sub

sub onTempResponse(obj)
    m.temp = obj.getData()
    ? "onTempResponse: " m.temp
    m.tempLabel.text = m.temp

end sub

sub onWeekTempResponse(obj)
    m.week_temp = obj.getData()
    ? "onTempResponse: " m.week_temp
    m.weekLabel.text = m.week_temp

end sub



