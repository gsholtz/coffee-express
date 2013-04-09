$(document).ready ->
  $("a.delete").click (e) ->
    e.preventDefault()
    e.stopPropagation()
    $.post "/user/delete"
    ,
      id: e.currentTarget.id
    ,
      (data) ->
        if data.removed
          $(e.currentTarget)
          .parent().parent()
          .find("td")
          .wrapInner("<div style='display: block;' />")
          .parent()
          .find("td > div")
          .slideUp 400, ->
            $(@).parent().parent().remove()




      