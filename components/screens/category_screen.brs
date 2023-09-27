function init()
    ? "[category_screen] init"
    m.category_list = m.top.findNode("category_list")
    m.category_list.setFocus(true)
    m.top.observeField("visible", "onVisibleChange")
    m.category_list.observeField("itemSelected", "onCategorySelected")
end function

sub onCategorySelected(obj)
    ? "onCategorySelected field: ";obj.getField()
    ? "onCategorySelected data: ";obj.getData()
    ? "onCategorySelected checkedItem: "; m.category_list.checkedItem
end sub

sub onVisibleChange()
    if m.top.visible = true then
        m.category_list.setFocus(true)
    end if
end sub
