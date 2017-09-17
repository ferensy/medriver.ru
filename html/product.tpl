<!-- new design -->
{$cols='none' scope=parent}
<section class="block product">
	<div id="breadcrumb" itemprop="breadcrumb">
		<a href="/">Главная</a>		
		{if $category}
			/ <a href="products/">Каталог</a>
			{foreach from=$category->path item=cat}
			/ <a href="catalog/{$cat->url}">{$cat->name|escape}</a>
			{/foreach}
		{/if}
		{if $brand}
			/ <a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a>
		{/if}
	</div>

	<div class="product" itemscope itemtype="http://schema.org/Product">
		<aside class="images">
			{if $product->image}
			<div class="image corner rc10">
				<a href="{$product->image->filename|resize:800:600:w}" class="zoom" data-rel="group"><img itemprop="image" src="{$product->image->filename|resize:340:340}" alt="{$product->product->name|escape}" class="corner" /></a>
			</div>
			{/if}
			{if $product->images|count>1}
			<div class="images">
				<div class="scroll">
				{foreach $product->images as $i=>$image}
					<a href="{$image->filename|resize:800:600:w}" class="zoom corner5" data-rel="group"><img src="{$image->filename|resize:100:100}" alt="{$product->name|escape}" /></a>
				{/foreach}
				</div>
			</div>
			{/if}
		
		</aside>
		<section class="detail">
			<h1 itemprop="name">{$product->name|escape}</h1>

			<div class="form">
			{if $product->variant}
				<form class="variants" action="/cart" method="get">
					<input name="variant" value="{$product->variant->id}" type="hidden" />								
				</form>
					<div class="priceline">
                                         <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
						<span itemprop="price" class="price">{$product->variant->price|convert} {$currency->sign}</span>
						<input type="button" class="bigbutton" value="В корзину"/>
						<div class="none">
							<div class="modal dialog amount" id="amount{$product->variant->id}">
							<form class="variant" action="/cart" method="get">
								<input name="variant" value="{$product->variant->id}" type="hidden" />								
								<h3 class="header"><a href="#" class="close" onclick="$.fancybox.close(); return false;">Закрыть</a>В корзину</h3>
								<div class="amountline">
									<p>
										<a href="products/{$product->url}">{$product->name|escape}</a>
									</p>
									<div class="amount">
										<input name="amount" value="1" type="text" min="1" />
										<span class="plus">+</span>
										<span class="minus">-</span>
									</div>
								</div>
								<p class="clear"></p>
								<p class="center"><input type="submit" class="mediumbutton" value="Добавить в корзину" /></p>
							</form>								
							</div>
						</div>		
                                          </div>
					</div>
					<a href="#opt" class="ajax">Узнать оптовую цену</a>
				<div class="none">
					<div class="dialog" id="opt">
						<form action="ajax/feadback.php" method="post" class="ajaxform">
							<h3 class="header"><a href="#" class="close" onclick="$.fancybox.close(); return false;">Закрыть</a>Узнать оптовую цену</h3>
							<input type="hidden" name="message" value="Оптовая цена на {$product->name|escape}" />
							<p class="line">
								<label>
								Представьтесь, пожалуйста
								</label>
								<input type="text" class="text big corner5" name="name" value="" />
							</p>
							<p class="clear"></p>
							<p class="line">
								<label>
								Контактный телефон
								</label>
								<input type="text" class="text big corner5" name="phone" value="" />
							</p>
							<p class="clear"></p>
							<p class="line">
								<label>
								Удобное время для звонка
								</label>
								<input type="text" class="text big corner5" name="calltime" value="" />
							</p>
							<p class="clear"></p>
							<p class="center"><input type="submit" class="mediumbutton" value="Отправить" /></p>
						</form>
					</div>
				</div>					
				
			{else}
					<div class="priceline">
						Нет в наличии
					</div>
			
			{/if}
			</div>
						
			<div class="description" itemprop="description">			
				{$product->body}							
			</div>
		</section>
		<p class="clear"></p>
	</div>
	
</section>