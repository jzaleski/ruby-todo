# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
	# Set focus to the last text input
	$('input[type="text"]:last').focus()
	# disable form submit unless a "summary" is specified
	$('form').submit(->
		if(!$('#todo_summary', $(this).next()).val())
			return false
	)
	# Ensure that links open in the same window
	$(document).on('click', 'a', (event) ->
		event.preventDefault()
		location.href = $(event.target).attr('href')
	)
)
