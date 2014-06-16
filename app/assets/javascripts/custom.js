$(document).ready(function(){
	$('#date').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true
		});
	
	$('#case_date').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true
		});

	$('#refreshcustomers').click(function() {
		$("#log_customer_id").load()
	});
		
	
});