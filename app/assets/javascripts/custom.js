$(document).ready(function(){
	$('#date').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true
		});
	
	$('.datepicker').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true
		});

	var clip = new ZeroClipboard($("#d_clip_button"))

	$('#log_description').keyup(function() {
		$('.my_clip_button').hide()
	});
});