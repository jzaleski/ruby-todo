# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
	# Set focus to the first text input
	$('input[type="text"]:first').focus()
	# disable form submit unless a "email" and "password" are specified
	$('form').submit(->
		if(!$('#email').val() || !$('#password').val())
			return false
	)
)
