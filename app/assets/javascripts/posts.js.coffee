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
			aspectRatio: true
			autoScale: true
			scrolling: no

		$('a#post-form').fancybox
			width: 400

	$('.fancybox-display a').hover(
  	-> $('.fancybox-display h5').fadeIn(150)
  	-> $('.fancybox-display h5').fadeOut(150)
  )

	$('.alert').fadeOut(10000)
