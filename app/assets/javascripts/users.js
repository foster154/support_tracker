$(document).ready(function() {
	$('#edition').on('click', '.pricing-btn', function() {
		$(this).addClass('btn-clicked');
		$(this).siblings().removeClass('btn-clicked');
		selected_edition = +$(this).data('value');
		console.log(selected_edition);
	});

	$('#licenses').on('click', '.pricing-btn', function() {
		$(this).addClass('btn-clicked');
		$(this).siblings().removeClass('btn-clicked');
		selected_licenses = +$(this).data('value');
		console.log(selected_licenses);
	});

	$('#pricing').on('click', '#calculate', function(event) {
		console.log("click detected")
		event.preventDefault();
		console.log("default prevented")
		var per_month = selected_edition * selected_licenses;
		console.log("'per month' set")
		var per_year = selected_edition * .9 * selected_licenses * 12;
		console.log("'per year' set")
		$('#results').text("$" + per_month + " per month, or $" + per_year + " per year (10% off)" );
	});
	
	$('#reset').on('click', function(calc) {
		event.preventDefault();
		$('div').removeClass('btn-clicked');
		selected_edition = null;
		selected_licenses = null;
		$('#results').text("");
	});
});