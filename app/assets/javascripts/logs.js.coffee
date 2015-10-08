# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#log_tag_ids').chosen()
	$('#log_customer_id').chosen()
	$('#modal_create_cust').click ->
		$('#newCustomerModal').modal('hide')
	$('#show-followup-btn').click ->
		$('.followup-area').slideToggle()
	
	$('.next-prev-title').click ->
		$('.prev-btn').hide()
		$('.next-prev-title').hide()
		$('.next-btn').hide()
		$('.go-to-date-selector').show()
	$('.close-date-selector').click ->
		$('.prev-btn').show()
		$('.next-prev-title').show()
		$('.next-btn').show()
		$('.go-to-date-selector').hide()