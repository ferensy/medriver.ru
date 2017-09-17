{* Информера корзины (отдаётся аяксом) *}
			<div class="incart{if $cart->total_products>0} act{/if}">
				<span class="saper{if $cart->total_products>0} act{/if}"></span>
				<aside{if $cart->total_products>0} class="act"{/if}>
{if $cart->total_products>0}
	<p class="act">
	{$cart->total_products|plural:'Товар':'Товаров':'Товара'} в корзине: <strong>{$cart->total_products} {$settings->units}</strong><br />
	На сумму: <strong>{$cart->total_price|convert} {$currency->sign|escape}</strong></p>
{else}
	<p>В корзине нет товаров</p>
{/if}
				</aside>
				<a href="cart/" class="{if $cart->total_products>0}butta{else}butt{/if}">Оформить заказ</a>
			</div>
