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
          $(e.currentTarget).parent().parent().slideUp 600, ->
            @remove()