{* Список товаров *}
<section class="block products">
	{if $category}
	<div id="breadcrumb" itemprop="breadcrumb">
		<a href="/">Главная</a>		
		{if $category}
		/ <a href="products/">Каталог</a>
		{foreach from=$category->path item=cat}
		{if !$cat@last}
		/ <a href="catalog/{$cat->url}/">{$cat->name|escape}</a>
		{elseif $brand}
		/ <a href="catalog/{$cat->url}/">{$cat->name|escape}</a>
		{/if}
		{/foreach}  
		{if $brand}
		{/if}
		{elseif $brand}
		/ <a href="products/">Каталог</a>
		{elseif $keyword}
		/ Поиск {$keyword}
		{/if}
	</div>
	
	{/if}
	<h1>
	{if $keyword}
		Поиск {$keyword|escape}
	{elseif $page}
		{$page->name|escape}
	{else}
		{$category->name|escape} {$brand->name|escape} {$keyword|escape}
	{/if}
	</h1>
	
{if $page && !$keyword}
	{if $categories}
	{foreach $categories AS $cat}
		{if $cat->visible==1}
			<h2><a href="catalog/{$cat->url}">{$cat->name|escape}</a></h2>
			{if $cat->subcategories}
				{foreach $cat->subcategories AS $c}
					{if $c->visible==1}
						<h3><a href="catalog/{$c->url}">{$c->name|escape}</a></h3>
						{get_products var=products limit=6 category_id=$c->children}
						{if $products}
						<ul class="products">
							{foreach $products as $product}
							<li class="product{if $product->featured} featured{/if}">
								<div class="item corner rc10">
									<div class="image">
									{if $product->image}
										<a href="products/{$product->url}"><img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}"/></a>
									{/if}
									</div>
									<p><a data-product="{$product->id}" href="products/{$product->url}">{$product->name|escape}</a></p>
									{if $product->variants|count > 0}
									<form class="variants" action="/cart">
										<input id="variant_{$product->variant->id}" name="variant" value="{$product->variant->id}" type="hidden" />					
									</form>
										<span class="price">{$product->variant->price|convert} <span class="currency">{$currency->sign}</span></span>
										<input type="button" class="button" value="В корзину"/>
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
									{else}
										Нет в наличии
									{/if}
								</div>
								{if $product->featured}
									<span class="icon hit">Хит продаж!</span>
								{/if}
							</li>
							{/foreach}						
						</ul>
						<p class="clear"></p>									
						{/if}
					{/if}
				{/foreach}			
			{else}
				{get_products var=products limit=6 category_id=$cat->children}
				{if $products}
				<ul class="products">
					{foreach $products as $product}
					<li class="product{if $product->featured} featured{/if}">					
						<div class="item corner rc10">
							<div class="image">
							{if $product->image}
								<a href="products/{$product->url}"><img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}"/></a>
							{/if}
							</div>
							<p><a data-product="{$product->id}" href="products/{$product->url}">{$product->name|escape}</a></p>
							{if $product->variants|count > 0}
							<form class="variants" action="/cart">
								<input id="variant_{$product->variant->id}" name="variant" value="{$product->variant->id}" type="hidden" />					
							</form>
								<span class="price">{$product->variant->price|convert} <span class="currency">{$currency->sign}</span></span>
								<input type="button" class="button" value="В корзину"/>
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
							{else}
								Нет в наличии
							{/if}
						</div>
						{if $product->featured}
							<span class="icon hit">Хит продаж!</span>
						{/if}
					</li>
					{/foreach}						
				</ul>
				<p class="clear"></p>									
				{/if}
			
			{/if}
		{/if}
	{/foreach}
	{/if}
{elseif $category && $category->subcategories}
	{foreach $category->subcategories AS $cat}
		{if $cat->visible==1}
			<h3><a href="catalog/{$cat->url}">{$cat->name|escape}</a></h3>		
			{get_products var=products limit=6 category_id=$cat->children}
			{if $products}
			<ul class="products">
				{foreach $products as $product}
				<li class="product{if $product->featured} featured{/if}">					
					<div class="item corner rc10">
						<div class="image">
						{if $product->image}
							<a href="products/{$product->url}"><img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}"/></a>
						{/if}
						</div>
						<p><a data-product="{$product->id}" href="products/{$product->url}">{$product->name|escape}</a></p>
						{if $product->variants|count > 0}
						<form class="variants" action="/cart">
							<input id="variant_{$product->variant->id}" name="variant" value="{$product->variant->id}" type="hidden" />					
						</form>
							<span class="price">{$product->variant->price|convert} <span class="currency">{$currency->sign}</span></span>
							<input type="button" class="button" value="В корзину"/>
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
						{else}
							Нет в наличии
						{/if}
					</div>
					{if $product->featured}
						<span class="icon hit">Хит продаж!</span>
					{/if}
				</li>
				{/foreach}						
			</ul>
			<p class="clear"></p>									
			{/if}
		{/if}
	{/foreach}
{else}
	{if $products|count>0}
	<ul>
		{foreach $products as $product}
			<li class="product{if $product->featured} featured{/if}">					
				<div class="item corner rc10">
					<div class="image">
					{if $product->image}
						<a href="products/{$product->url}"><img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}"/></a>
					{/if}
					</div>
					<p><a data-product="{$product->id}" href="products/{$product->url}">{$product->name|escape}</a></p>
					{if $product->variants|count > 0}
					<form class="variants" action="/cart">
						<input id="variant_{$product->variant->id}" name="variant" value="{$product->variant->id}" type="hidden" />					
					</form>
						<span class="price">{$product->variant->price|convert} <span class="currency">{$currency->sign}</span></span>
						<input type="button" class="button" value="В корзину"/>
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
					{else}
						Нет в наличии
					{/if}
				</div>
				{if $product->featured}
					<span class="icon hit">Хит продаж!</span>
				{/if}
			</li>
		{/foreach}					
	</ul>
	<p class="clear"></p>
	{include file='pagination.tpl'}	
	
	{/if}
{/if}


	{if $page->body}
		<div>
			{$page->body}
		</div>
		<p>&nbsp;</p>
        {elseif $category->description}
		<div>
			{$category->description}
		</div>
		<p>&nbsp;</p>
	{/if}


	<p class="clear"></p>
</section>