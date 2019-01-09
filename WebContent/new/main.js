
$(document).ready(function(){
	$("#myCarousel").carousel(
			{pause:true,
				interval:false
			}
			);
	console.log("Yes");
});





$(document).ready(function($) {

	$('#uCarousel').carousel({
		interval: 10000
	});

	//Handles the carousel thumbnails
	$('[id^=carousel-selector-]').click(function () {
		var id_selector = $(this).attr("id");
		try {
			var id_set=/-(\d+)$/.exec(id_selector);
			var id = /-(\d+)$/.exec(id_selector)[1];
			//console.log(id_selector, id);
			//console.log("-----:"+id_set);
			//console.log("Silence find it~")
			jQuery('#uCarousel').carousel(parseInt(id));
		} catch (e) {
			console.log('Regex failed!', e);
		}
	});
	// When the carousel slides, auto update the text
	$('#uCarousel').on('slid.bs.carousel', function (e) {
		var id = $('.item.active').data('slide-number');
		//console.log("----change--text--:"+id);
		$('#carousel-text').html($('#slide-content-'+id).html());
		//console.log("text---is---to--change");
	});
});                                          


//<!--  it is used for moving~ -->

$(document).ready(function() {

	$('#target').click(function() {
		console.log('Just for moving  down.......')
			//var $anchor = $(this);

			$('html, body').animate({
				//scrollTop: $($anchor.attr('href')).offset().top
				scrollTop: $(".targetmove").offset().top
			}, 2000);
		return false;
		helpers : {
		}
	});
	console.log('Moving Finished~');
});    

$(document).ready(function() {

	$('.btn-back').click(function() {
		console.log('Just for moving  Up.......')
			//var $anchor = $(this);

			$('html, body').animate({
				//scrollTop: $($anchor.attr('href')).offset().top
				scrollTop: $(".gallery").offset().top
			}, 2000);
		return false;
		helpers : {
		}
	});
	console.log('Moving Finished~');
});


//<!--  Ticket sale use!-->    

$(document).ready(function () {
	//Initialize tooltips
	$('.nav-tabs > li a[title]').tooltip();

	//Wizard
	$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

		var $target = $(e.target);


		if ($target.parent().hasClass('disabled')) {

			//var text =$target. 
			console.log("disabled choose-----");
			return false;
		}
	});

	$(".next-step").click(function (e) {

		var $active = $('.wizard .nav-tabs li.active');
		$active.next().removeClass('disabled');
		nextTab($active);
		console.log("remove unactive~")

	});
	$(".prev-step").click(function (e) {

		var $active = $('.wizard .nav-tabs li.active');
		prevTab($active);
		console.log("preTab is active, do nothing!");

	});
});

function nextTab(elem) {
	$(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
	$(elem).prev().find('a[data-toggle="tab"]').click();
}



