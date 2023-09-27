sub init()
    m.content_grid = m.top.FindNode("content_grid")
    m.header = m.top.FindNode("header")
    m.top.observeField("visible", "onVisibleChange")
end sub

sub onVisibleChange()
    if m.top.visible = true then
        m.content_grid.setFocus(true)
    end if
end sub

sub onCategoryChanged(obj)
    feed = obj.getData()
    m.header.text = feed.title
    posterContent = createObject("roSGNode", "ContentNode")
    for each item in feed.items
        node = createObject("roSGNode", "ContentNode")
        node.title = item.title
        node.HDGRIDPOSTERURL = "pkg:/images/moab.jpg"
        node.SHORTDESCRIPTIONLINE1 = item.title
        node.SHORTDESCRIPTIONLINE2 = item.description
        posterContent.appendChild(node)
    end for
    showPosterGrid(posterContent)
end sub

sub showPosterGrid(content)
    m.content_grid.content = content
    m.content_grid.visible = true
    m.content_grid.setFocus(true)
end sub

