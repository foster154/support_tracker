$(document).ready(function() {

	// Pricing Calculator
	// ===========================

	$('#edition').on('click', '.pricing-btn', function() {
		$(this).addClass('btn-clicked');
		$(this).siblings().removeClass('btn-clicked');
		selected_edition = +$(this).data('value');
	});

	$('#licenses').on('click', '.pricing-btn', function() {
		$(this).addClass('btn-clicked');
		$(this).siblings().removeClass('btn-clicked');
		selected_licenses = +$(this).data('value');
	});

	$('#pricing').on('click', '#calculate', function(event) {
		event.preventDefault();
		var per_month = selected_edition * selected_licenses;
		var per_year = selected_edition * .9 * selected_licenses * 12;
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