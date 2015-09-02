# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#post-form').hide()

	$('#all-posts').imagesLoaded ->
		$('#all-posts').masonry
			itemSelector: '.box'
			isFitWidth: true
			columnWidth: 1
			isAnimated: true

	$('#new-post-button').click ->
		$('#new-post-button').hide()
		$('#post-form').show(1000)

	$('.alert').fadeOut(5000)

@show_post_form = () ->
	$('#post-form').show()
	$('#new-post-button').hide()