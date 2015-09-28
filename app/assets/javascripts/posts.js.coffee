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
			helpers : { 
    		title : { type : 'over'}
   		}
			closeBtn: false
			centerOnScroll: true
			autoSize: true
			fitToView: true
			aspectRatio: false
			scrolling: no
		$('.fancybox').mouseenter ->
    	$(this).siblings().stop().slideToggle(300)
    $('.fancybox').mouseleave ->
    	$(this).siblings().stop().slideToggle(300)
    $('.post-delete').mouseenter ->
    	$(this).stop().show()
    $('.post-delete').mouseleave ->
    	$(this).stop().hide()
			

		$('a#post-form').fancybox
			width: 400

	$('.fancybox-inner').hover(
  	-> ('.fancybox-title').stop().fadeIn(150)
  	-> ('.fancybox-title').stop().fadeOut(150)
  )

	$('.alert').fadeOut(10000)
