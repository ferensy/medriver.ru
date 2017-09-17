{* Список записей блога *}
<section class="block blog">

<!-- Заголовок /-->
<h1>{$page->name}</h1>

<div itemscope itemtype="http://schema.org/NewsArticle">
	{foreach $posts as $post}
			<article>
				{if $post->image}
				<span class="image">
					<a href="actions/{$post->url}/">
						<img src="{$post->image|resizeact:100}" alt="{$post->name|escape}" itemprop="image" border="0" />
					</a>
				</span>
				{/if}
				<h3 itemprop="name">	
					<a href="actions/{$post->url}/" title="{$post->name|escape}" itemprop="url">
							{$post->name|escape}
					</a>
				</h3>
				<div class="txt" itemprop="description">
					{$post->annotation|strip_tags}
				</div>
				<p class="clear"></p>
			</article>
	{/foreach}
</div>

{include file='pagination.tpl'}
</section>          