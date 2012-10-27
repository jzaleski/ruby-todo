# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
	# Stylize buttons
	$('input[type="submit"]').button();
	# Set focus to the input when it is present
	$('#todo_summary').focus();
);
