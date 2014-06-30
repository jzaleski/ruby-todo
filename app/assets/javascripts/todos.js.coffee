# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
  # set focus to the last text-input (currently the first text-input in the list
  # is the "list_name" -- skip selection in this case)
  if($('input[type="text"]').length > 1)
    $('input[type="text"]:last').focus()

  # disable form submit unless a "summary" is specified
  $('form').submit(->
    if(!$('#todo_summary', $(this).next()).val())
      return false
  )

  # memoize a reference to the top-level document
  $document = $(document)

  # ensure that links open in the same window
  $document.on('click', 'a', (event) ->
    event.preventDefault()
    location.href = $(event.target).attr('href')
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
