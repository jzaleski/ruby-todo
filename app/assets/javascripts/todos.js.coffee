# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js. You can use
# CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
  # set focus to the last text-input (currently the first text-input in the
  # list is the "list_name" -- skip selection in this case)
  if($('input[type="text"]').length > 1)
    $('input[type="text"]:last').focus()

  # memoize a reference to the top-level document
  $document = $(document)

  $document.on('change', 'input[type="checkbox"]', (event) ->
    event.preventDefault()
    event.stopImmediatePropagation()
    action = $(this).parent().parent().attr('action')
    $.ajax action,
      type: 'put',
      data: {todo: {completed: $(this).is(':checked')}}
      dataType: 'json'
      success: (data, textStatus, jqXhr) ->
        window.location = '/todos'
  )

  # ensure that links open in the same window
  $document.on('click', 'a', (event) ->
    event.preventDefault()
    event.stopImmediatePropagation()
    location.href = $(event.target).attr('href')
  )

  # on keypress in the text-field, create the item if it is valid
  $document.on('keypress', 'input[type="text"]', (event) ->
    if(event.which != 13)
      return true
    event.preventDefault()
    event.stopImmediatePropagation()
    action = $(this).parent().parent().attr('action')
    $.ajax action,
      type: if action == '/todos' then 'post' else 'put'
      data: {todo: {summary: $(this).val()}}
      dataType: 'json'
      success: (data, textStatus, jqXhr) ->
        window.location = '/todos'
  )

  # add swipe-left event handler
  $document.on('swipeleft', (event) ->
    $next_link = $('a.next')
    if($next_link.css('visibility') == 'visible')
      $next_link.click()
  )

  # add swipe-right event handler
  $document.on('swiperight', (event) ->
    $previous_link = $('a.previous')
    if($previous_link.css('visibility') == 'visible')
      $previous_link.click()
  )
)
