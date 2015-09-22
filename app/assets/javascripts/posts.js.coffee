# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


show_form = false
$ ->
	$('#post-form').hide()
	$('#floating-div').hide()

	$('#all-posts').imagesLoaded ->
		$('#all-posts').masonry
			itemSelector: '.box'
			isFitWidth: true
			isAnimated: true
		$('a.fancybox').fancybox
			padding: 4
			closeBtn: false
			centerOnScroll: true

	$('#new-post-button').click ->
		if (show_form)
			$('#post-form').slideUp(500)
			$('#new-post-button').css('background-color', '#01914f')
			$('#new-post-button').css('box-shadow', 'none')
			show_form = false
		else
			$('#post-form').slideDown(500)
			$('#new-post-button').css('background-color', '#015e33')
			$('#new-post-button').css('box-shadow', '0 0 10px 0 #01914f')
			show_form = true

	$('.alert').fadeOut(10000)


@show_post_form = () ->
	$('#post-form').show()
	$('#new-post-button').css('background-color', '#015e33')
	$('#new-post-button').css('box-shadow', '0 0 10px 0 #01914f')
	show_form = true

@show_floating_div = (image_path) ->
