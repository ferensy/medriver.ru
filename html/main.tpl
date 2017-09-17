<section class="block text">
	<h1>{$page->header|escape}</h1>
      
<section class="block catalog">
	<h2>Каталог продукции</h2>
	<ul>
		{foreach $categories AS $cat}
		<li>
			<div class="item corner rc10">
				<span class="image">{if $cat->image}<a href="catalog/{$cat->url}"><img itemprop="image" src="{$cat->image|resizecat:200:200}" alt="{$cat->name|escape}" /></a>{/if}</span>
				<p itemprop="name"><a href="catalog/{$cat->url}">{$cat->name|escape}</a></p>
			</div>
		</li>
		{/foreach}		
	</ul>
	<p class="clear"></p>
</section>
  {$page->body}
</section>
	
