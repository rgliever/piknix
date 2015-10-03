# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#all-posts').imagesLoaded ->
		$('#all-posts').masonry
			itemSelector: '.box'
			isFitWidth: true
			isAnimated: true
		$('a.fancybox').fancybox
			padding: 0
			closeBtn: false
			centerOnScroll: true
			autoSize: true
			fitToView: true
			aspectRatio: true
			scrolling: no
		$('.fancybox').mouseenter ->
    	$(this).siblings().stop().slideToggle(300)
    $('.fancybox').mouseleave ->
    	$(this).siblings().stop().slideToggle(300)
    $('.post-delete, #post-info').mouseenter ->
    	$(this).stop().show()
    $('.post-delete, #post-info').mouseleave ->
    	$(this).stop().hide()
			

		$('a#post-form').fancybox
			width: 400

	$('.fancybox-display a').hover(
  	-> $(this).siblings('#post-info').stop().fadeIn(300)
  	-> $(this).siblings('#post-info').stop().fadeOut(300)
  )

	$('#tag_cloud_button').click ->
		$('#tag_cloud_button').css('color', '#02dd78')
		$('#tag_cloud_button').css('border-bottom', '2px solid #02dd78')

	$('.alert').fadeOut(10000)
