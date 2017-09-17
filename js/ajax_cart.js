// Аяксовая корзина
$('form.variant').live('submit', function(e) {
	$.fancybox.close();
	e.preventDefault();
	button = $(this).find('input[type="submit"]');
	if($(this).find('input[name=variant]:checked').size()>1)
		variant = $(this).find('input[name=variant]:checked').val();
	if($(this).find('select[name=variant]').size()>0)
		variant = $(this).find('select').val();
	if($(this).find('input[name=variant]').size() == 1)
		variant = $(this).find('input[name=variant]').val();
	if($(this).find('input[name=amount]'))
		amount = $(this).find('input[name=amount]').val();
	$.ajax({
		url: "ajax/cart.php",
		data: {variant: variant, amount: amount},
		dataType: 'json',
		success: function(data){
			$('#cart_informer').html(data);
		}
	});
	var o1 = $(this).offset();
	var o2 = $('#cart_informer').offset();
	var dx = o1.left - o2.left;
	var dy = o1.top - o2.top;
	var distance = Math.sqrt(dx * dx + dy * dy);
	$(this).closest('.product').find('.image img').effect("transfer", { to: $("#cart_informer"), className: "transfer_class" }, distance);	
	$('.transfer_class').html($(this).closest('.product').find('.image').html());
	$('.transfer_class').find('img').css('height', '100%');
	return false;
});