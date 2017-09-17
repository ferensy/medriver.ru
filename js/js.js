$(document).ready(function(){
		//  Автозаполнитель поиска
		$(".input_search").autocomplete({
			serviceUrl:'ajax/search_products.php',
			minChars:1,
			noCache: false, 
			onSelect:
				function(value, data){
					 $(".input_search").closest('form').submit();
				},
			fnFormatResult:
				function(value, data, currentValue){
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
	  				return (data.image?"<img align=absmiddle src='"+data.image+"'> ":'') + value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>');
				}	
		});

		jQuery("a.zoom").fancybox({ 'hideOnContentClick' : true });


		jQuery("a.ajax").fancybox({ 
			'showCloseButton': false,
			 tpl: {
				  closeBtn: '<div title="Close" class="myClose">Закрыть</div>'
			 } 
		});

	$('p.tabs a').click(function (e) {
	    e.preventDefault();
		$('p.tabs a').removeClass('active');
		$(this).addClass('active');
		var tabid = $(this).attr('href').substr(1);
		$('div.panel').addClass('none');
		$('div#tab_'+tabid).removeClass('none');
		if(tabid=='ur'){
			$('p.tabs input[name=ur]').val(1);
		}else{
			$('p.tabs input[name=ur]').val(0);
		}
		return false;
	});



function ajaxFormRequest(form, callback, callbackbf) {
	jQuery.ajax({
		url: form.action,
		type: form.method,
		dataType: "html",
		data: jQuery(form).serialize(),
		success: callback,
		beforeSend: callbackbf
	});
}
jQuery('form.ajaxform').submit(function(e){			
	var form = this;
	ajaxFormRequest(form, function(dat){
		jQuery(form)[0].reset();
		jQuery.fancybox.hideActivity();
		jQuery.fancybox(dat,{
			'showCloseButton': false,
			 tpl: {
				  closeBtn: '<div title="Close" class="myClose">Закрыть</div>'
			 } 		
		});
	}, function(){
		jQuery.fancybox.showActivity();
	}
	);
	e.preventDefault();
	return false;
});	


	jQuery('div.item input.button, div.form div.priceline input.bigbutton').click(function (e) {
		var th = this;
		var varik = $(th).parents('div.form, div.item').find('form.variants').find('input[name=variant]').val();
		jQuery.fancybox({
			href: '#amount'+varik,
			'showCloseButton': false,
			 tpl: {
				  closeBtn: '<div title="Close" class="myClose">Закрыть</div>'
			 } 		
		});
	    e.preventDefault()
	})

	$('form.variants div.amount input[type=button]').click(function (e) {
		var th = this;
		$.fancybox.close();
		$(th).closest('form.variant').submit();
		e.preventDefault()
	})

				$('.minus').click(function () {
					var $input = $(this).parent().find('input[name="amount"], input.amou');
					var min = parseInt($input.attr('min'));
					var count = parseInt($input.val()) - min;
					count = count < min ? min : count;
					$input.val(count);
					$input.change();
					return false;
				});

				$('.plus').click(function () {
					var $input = $(this).parent().find('input[name="amount"], input.amou');
					var min = parseInt($input.attr('min'));
					$input.val(parseInt($input.val()) + min);
					$input.change();
					return false;
				});
	$('.table span.amount input').change(function () {
		calctotal(this)
	})
	$('.table span.amount input').keypress(function(){
		calctotal(this)
	});
	function calctotal(th){
		var count = parseInt($(th).val());
		var row = $(th).closest('div.row');
		var varik =  $(row).attr('id').replace(/\D+/g,"");
		var rowtotal = parseInt($(row).find('span.price').text().replace(/\D+/g, ''));
		$(row).find('span.price2 span').text( accounting.formatNumber(rowtotal*count,0,' ') );
		$.ajax({
			url: "ajax/cart.php",
			data: {variant: varik, amount: count, update: 1},
			dataType: 'json',
			success: function(data){
				$('#cart_informer').html(data);
			}
		});
		calcall();
	}
	function calcall(){
		var total_products = 0;
		var total_price = 0;
		$(".table div.row").each(function( index ) {
			total_price = total_price + parseInt($(this).find('span.price2 span').text().replace(/\s+/g, ''));
			total_products = total_products + parseInt($(this).find('span.amount input').val());		
		});		
		$(".table div.footer span.amount em").text(total_products);
		$(".table div.footer span.price2 span").text( accounting.formatNumber(total_price,0, ' ') );
	}
	
});

$(window).load(function(){
		$(".scroll").jScrollPane({ reinitialiseOnImageLoad: true, showArrows:true, horizontalDragMaxWidth: 50 });
});
