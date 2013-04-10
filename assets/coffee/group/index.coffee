$(document).ready ->
  $("a.create").click (e) ->
    e.preventDefault()
    e.stopPropagation()
    console.log "Create row"

#    $('#my_table > tbody > tr.my_row')
# .find('td')
# .wrapInner('<div style="display: none;" />')
# .parent()
# .find('td > div')
# .slideDown(700, function(){
#  var $set = $(this);
#  $set.replaceWith($set.contents());
# });

  $("a.delete").click (e) ->
    e.preventDefault()
    e.stopPropagation()
    $.post "/group/delete"
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
 