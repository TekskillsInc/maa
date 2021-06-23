$('#mobile-div').hide();
window.onload = function () {

	var windowWidth = $(window).width();
	if (windowWidth <= 767){

		$(window).scroll(function () {
			if ($(this).scrollTop() < 50) {

				$('#bannerpost').fadeIn();
				$('#bannerpost').css({
					transition: 'all 0.5s ease'
				});

			} else {
				$('#bannerpost').fadeOut();
				$('#bannerpost').css({
					transition: 'all 0.2s ease'
				});
			}
		});
		
		$(document).scroll(function () {
    var y = $(this).scrollTop();
    if (y > 250) {
        $('#mobile-div').fadeIn();
    } else {
        $('#mobile-div').fadeOut();
    }

});
		
}
else {
	$(window).scroll(function () {
		if ($(this).scrollTop() < 50) {

			$('#bannerpost').show();
			$('#bannerpost').css({
				transition: 'all 0.5s ease'
			});
			$('#custmNavbrnad').css({
				position: 'absolute',
				top: '0px',
			});

		} else {
			$('#bannerpost').show();
			$('#bannerpost').css({
				transition: 'all 0.2s ease'
			});


		}

	});


};

};


var clipboard = new ClipboardJS('.btn');

		clipboard.on('success', function(e) {
			console.log(e);
		});

		clipboard.on('error', function(e) {
			console.log(e);
		});

