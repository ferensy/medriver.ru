{* Страница заказа *}
<section class="block cart">

{$meta_title = "Ваш заказ №`$order->id`" scope=parent}

<h1>Ваш заказ №{$order->id} 
{if $order->status == 0}принят{/if}
{if $order->status == 1}в обработке{elseif $order->status == 2}выполнен{/if}
{if $order->paid == 1}, оплачен{else}{/if}
</h1>

	<section class="table">
		<div class="header">
			<span class="cell name">Наименование</span>
			<span class="cell price">Цена</span>
			<span class="cell price">Кол-во</span>
			<span class="cell price2">Стоимость</span>
		</div>

{foreach $purchases as $purchase}
		<div class="row">
			<span class="cell name"><a href="products/{$purchase->product->url}">{$purchase->product->name|escape}</a></span>
			<span class="cell price">{($purchase->variant->price)|convert} {$currency->sign}</span>
			<span class="cell price">
				{$purchase->amount} {$settings->units}
			</span>
			<span class="cell price2">{($purchase->variant->price*$purchase->amount)|convert}&nbsp;{$currency->sign}</span>
			</span>
		</div>		
{/foreach}
{if $order->discount > 0}
		<div class="footer">
			<span class="cell name">скидка</span>
			<span class="cell price"></span>
			<span class="cell price"></span>
			<span class="cell price2">{$order->discount}&nbsp;%</span>
			<span class="cell dell"></span>
		</div>
{/if}
{* Купон, если есть *}
{if $order->coupon_discount > 0}
		<div class="footer">
			<span class="cell name">купон</span>
			<span class="cell price"></span>
			<span class="cell price"></span>
			<span class="cell price2">&minus;{$order->coupon_discount|convert}&nbsp;{$currency->sign}</span>
		</div>
{/if}
{* Если стоимость доставки входит в сумму заказа *}
{if !$order->separate_delivery && $order->delivery_price>0}
		<div class="footer">
			<span class="cell name">{$delivery->name|escape}</span>
			<span class="cell price"></span>
			<span class="cell price"></span>
			<span class="cell price2">{$order->delivery_price|convert}&nbsp;{$currency->sign}</span>
		</div>
{/if}
{* Итого *}
		<div class="footer">
			<span class="cell name">итого</span>
			<span class="cell price"></span>
			<span class="cell price"></span>
			<span class="cell price2">{$order->total_price|convert}&nbsp;{$currency->sign}</span>
		</div>
{* Если стоимость доставки не входит в сумму заказа *}
{if $order->separate_delivery}
		<div class="footer">
			<span class="cell name">{$delivery->name|escape}</span>
			<span class="cell price"></span>
			<span class="cell price"></span>
			<span class="cell price2">{$order->delivery_price|convert}&nbsp;{$currency->sign}</span>
		</div>
{/if}

		<p class="clear"></p>
	</section>

{* Детали заказа *}
<h2>Детали заказа</h2>
<table class="order_info">
	<tr>
		<td>
			Дата заказа
		</td>
		<td>
			{$order->date|date} в
			{$order->date|time}
		</td>
	</tr>
	{if $order->ur==0}
		{if $order->name}
		<tr>
			<td>
				ФИО
			</td>
			<td>
				{$order->name|escape}
			</td>
		</tr>
		{/if}
		{if $order->email}
		<tr>
			<td>
				Email
			</td>
			<td>
				{$order->email|escape}
			</td>
		</tr>
		{/if}
		{if $order->phone}
		<tr>
			<td>
				Контактный телефон
			</td>
			<td>
				{$order->phone|escape}
			</td>
		</tr>
		{/if}
		{if $order->address}
		<tr>
			<td>
				Город, адрес
			</td>
			<td>
				{$order->address|escape}
			</td>
		</tr>
		{/if}
	{else}
		{if $order->name}
		<tr>
			<td>
				Наименование
			</td>
			<td>
				{$order->name|escape}
			</td>
		</tr>
		{/if}
		{if $order->email}
		<tr>
			<td>
				Email
			</td>
			<td>
				{$order->email|escape}
			</td>
		</tr>
		{/if}
		{if $order->phone}
		<tr>
			<td>
				Контактный телефон
			</td>
			<td>
				{$order->phone|escape}
			</td>
		</tr>
		{/if}
		{if $order->address}
		<tr>
			<td>
				Юридический адрес
			</td>
			<td>
				{$order->address|escape}
			</td>
		</tr>
		{/if}
		{if $order->inn}
		<tr>
			<td>
				ИНН
			</td>
			<td>
				{$order->inn|escape}
			</td>
		</tr>
		{/if}
		{if $order->kpp}
		<tr>
			<td>
				КПП
			</td>
			<td>
				{$order->kpp|escape}
			</td>
		</tr>
		{/if}
	{/if}
	{if $order->comment}
	<tr>
		<td>
			Комментарий
		</td>
		<td>
			{$order->comment|escape|nl2br}
		</td>
	</tr>
	{/if}
</table>


{if !$order->paid}
{* Выбор способа оплаты *}
{if $payment_methods && !$payment_method && $order->total_price>0}
<form method="post">
<h2>Выберите способ оплаты</h2>
<ul id="deliveries">
    {foreach $payment_methods as $payment_method}
    	<li>
    		<div class="checkbox">
    			<input type=radio name=payment_method_id value='{$payment_method->id}' {if $payment_method@first}checked{/if} id=payment_{$payment_method->id}>
    		</div>			
			<h3><label for=payment_{$payment_method->id}>	{$payment_method->name} <!--, к оплате {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}--></label></h3>
			<div class="description">
			{$payment_method->description}
			</div>
    	</li>
    {/foreach}
</ul>
<input type='submit' class="ybutton" value='Закончить заказ'>
</form>

{* Выбраный способ оплаты *}
{elseif $payment_method}
<!--<h2>Способ оплаты &mdash; {$payment_method->name}</h2>
<p>
{$payment_method->description}
</p>
<h2>
К оплате {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
</h2>-->

{* Форма оплаты, генерируется модулем оплаты *}
{checkout_form order_id=$order->id module=$payment_method->module}
{/if}

{/if}

<p>&nbsp;</p>
<p class="clear"></p>
</section> 