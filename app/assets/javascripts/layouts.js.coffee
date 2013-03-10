jQuery ->
	# Scroll to comics controls or navigation when clicking skip-to-nav
	$('.skip-to-nav').click ->
		$("body").animate
		  scrollTop: $("#main-nav").offset().top
		, 500
		event.preventDefault()