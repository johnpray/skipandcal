jQuery ->
	# Do fancy animations when clicking the category button
	$(".category_button").click ->
		$('body').animate
			scrollTop: $('#categories').offset().top
		, 500, ->
		  $("#other_things, #random_comic, #controls, hr, #content, #bottom-controls").animate
		    opacity: 0.2
		  , 700, ->
		    $("#other_things, #random_comic, #controls, hr, #content, #bottom-controls").animate
		      opacity: 0.2
		    , 3000, ->
		      $("#other_things, #random_comic, #controls, hr, #content, #bottom-controls").animate
		        opacity: 1.0
		      , 1000
	  event.preventDefault()
