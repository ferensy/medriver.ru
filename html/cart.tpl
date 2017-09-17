{$meta_title = "Корзина" scope=parent}
<section class="block cart">
	<h1>
		{if $cart->purchases}Корзина{else}Корзина пуста{/if}	
	</h1>
	{if $cart->purchases}
	<form method="post" name="cart">
	
	<section class="table">
		<div class="header">
			<span class="cell name">Наименование</span>
			<span class="cell price">Цена</span>
			<span class="cell amount">Кол-во</span>
			<span class="cell price2">Стоимость</span>
			<span class="cell dell"></span>
		</div>
		{foreach from=$cart->purchases item=purchase}
		<div class="row" id="variant_{$purchase->variant->id}">
			<span class="cell name"><a href="products/{$purchase->product->url}">{$purchase->product->name|escape}</a></span>
			<span class="cell price">{($purchase->variant->price)|convert} {$currency->sign}</span>
			<span class="cell amount">
				<input name="amounts[{$purchase->variant->id}]" value="{$purchase->amount}" class="amou" type="text" min="1"/>
				<span class="plus">+</span>
				<span class="minus">-</span>			
			</span>
			<span class="cell price2"><span>{($purchase->variant->price*$purchase->amount)|convert}</span>&nbsp;{$currency->sign}</span>
			<span class="cell dell">
				<a href="cart/remove/{$purchase->variant->id}">Удалить</a>
			</span>
		</div>		
		{/foreach}
		<div class="footer">
			<span class="cell name">Итого без стоимости доставки:</span>
			<span class="cell price"></span>
			<span class="cell amount"><em>{$cart->total_products}</em> {$settings->units}</span>
			<span class="cell price2"><span>{$cart->total_price|convert}</span>&nbsp;{$currency->sign}</span>
			<span class="cell dell"></span>
		</div>
		<p class="clear"></p>
	</section>
	
	{* Доставка *}
	{if $deliveries}
	<h2>Выберите способ доставки:</h2>
	<ul id="deliveries">
		{foreach $deliveries as $delivery}
		<li>
			<div class="checkbox">
				<input type="radio" name="delivery_id" value="{$delivery->id}" {if $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries_{$delivery->id}">
			</div>
			
				<h3>
				<label for="deliveries_{$delivery->id}">
				{$delivery->name}
				{if $cart->total_price < $delivery->free_from && $delivery->price>0}
					({$delivery->price|convert}&nbsp;{$currency->sign})
				{elseif $cart->total_price >= $delivery->free_from}
					(бесплатно)
				{/if}
				</label>
				</h3>
				<div class="description">
				{$delivery->description}
				</div>
		</li>
		{/foreach}
	</ul>
	{/if}
	
	
	<h2>Оформление заказа</h2>
	
	<div class="form cart_form">         
		{if $error}
		<div class="message_error">
			{if $error == 'empty_name'}Введите ФИО/Наименование{/if}
			{if $error == 'empty_phone'}Введите контактный телефон{/if}
			{if $error == 'empty_email'}Введите email{/if}
			{if $error == 'empty_address'}Введите адрес{/if}
			{if $error == 'captcha'}Капча введена неверно{/if}
		</div>
		{/if}
	
		<p class="tabs">
			<input type="hidden" name="ur" value="0" />
			<label>Ваш статус</label>
			<a class="tab active" href="#fiz">Физ. лицо</a>
			<a class="tab" href="#ur">Юр. лицо</a>
		</p>
		<div class="panel {if $ur==1}none{/if}" id="tab_fiz">
			<p class="formline">
				<label>
					E-mail
				</label>
				<input class="corner5" type="text" name="email" value="{$email|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					ФИО получателя
				</label>
				<input class="corner5" type="text" name="name" value="{$name|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					Контактный телефон
				</label>
				<input class="corner5" type="text" name="phone" value="{$phone|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					Город, адрес
				</label>
				<input class="corner5" type="text" name="address" value="{$address|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					Комментарий	
				</label>
				<textarea class="corner5" name="comment">{$comment|escape}</textarea>
				<span class="clear"></span>
			</p>		
		</div>
		<div class="panel {if $ur!=1}none{/if}" id="tab_ur">
			<p class="formline">
				<label>
					E-mail
				</label>
				<input class="corner5" type="text" name="ur_email" value="{$ur_email|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					Наименование
				</label>
				<input class="corner5" type="text" name="ur_name" value="{$ur_name|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					Контактный телефон
				</label>
				<input class="corner5" type="text" name="ur_phone" value="{$ur_phone|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					Юридический адрес
				</label>
				<input class="corner5" type="text" name="ur_address" value="{$ur_address|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					ИНН
				</label>
				<input class="corner5" type="text" name="ur_inn" value="{$ur_inn|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					КПП
				</label>
				<input class="corner5" type="text" name="ur_kpp" value="{$ur_kpp|escape}" />
				<span class="clear"></span>
			</p>
			<p class="clear"></p>
			<p class="formline">
				<label>
					Комментарий
				</label>
				<textarea class="corner5" name="ur_comment">{$ur_comment|escape}</textarea>
				<span class="clear"></span>
			</p>
		</div>
		<input type="submit" name="checkout" class="ybutton" value="Отправить заказ">
	</div>
	</form>
	{/if}

</section>