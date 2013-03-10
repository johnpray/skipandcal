jQuery ->
	# Scroll down to top controls on all comics pages but home
	unless $('body.home').length
		$('body.comics.show').animate
			scrollTop: if $('ul.comics').length then $('ul.comics').offset().top-5
		, 500

	# Do fancy animations when clicking the category button
	$(".category_button").click ->
		$('body').animate
			scrollTop: $('#categories').offset().top
		, 500, ->
		  $("#other_things, #random_comic, #controls, hr, #content").animate
		    opacity: 0.2
		  , 700, ->
		    $("#other_things, #random_comic, #controls, hr, #content").animate
		      opacity: 0.2
		    , 3000, ->
		      $("#other_things, #random_comic, #controls, hr, #content").animate
		        opacity: 1.0
		      , 1000
	  event.preventDefault()