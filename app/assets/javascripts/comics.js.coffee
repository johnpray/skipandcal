jQuery ->
	unless $('body.home').length
		$('body.comics').animate
			scrollTop: $('#top-controls').offset().top
		, 500