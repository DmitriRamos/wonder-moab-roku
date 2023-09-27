function init()
    ? "[home_scene] init"
    m.category_screen = m.top.findNode("category_screen")
    m.content_screen = m.top.findNode("content_screen")
    m.weather_screen = m.top.findNode("weather_screen")

    m.category_screen.observeField("category_selected", "onCategorySelected")
    m.category_screen.setFocus(true)
end function

sub onCategorySelected()
    list = m.category_screen.findNode("category_list")
    ? "onCategorySelected checkedItem: ";list.checkedItem
    item = list.content.getChild(list.checkedItem)
    loadFeed(item.path)
end sub

sub loadFeed(path)
    m.content_task = createObject("roSGNode", "load_content_task")
    m.content_task.observeField("response", "onContentResponse")
    m.content_task.path = path
    m.content_task.control = "RUN"
end sub

sub onContentResponse(event as object)
    response = event.getData()

    data = ParseJson(response)
    ? "Data: "; data
    if data <> invalid
        m.category_screen.visible = false
        m.weather_screen.visible = false
        m.content_screen.visible = true
        m.content_screen.feed_data = data
    else
        ? "FEED RESPONSE IS EMPTY!"
    end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    ? "[home_scene] onKeyEvent", key, press
    if key = "back" and press
        if m.content_screen.visible
            m.content_screen.visible = false
            m.category_screen.visible = true
            m.weather_screen.visible = true
            m.category_screen.setFocus(true)
            return true
        end if
    end if
    return false
end function