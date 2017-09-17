{* Страница отдельной записи блога *}
<section class="block text" itemscope itemtype="http://schema.org/NewsArticle">
	<h1 itemprop="name">{$post->name|escape}</h1>
	<p itemprop="datePublished" datetime="{$post->date|date_format:"%Y-%m-%d"}">{$post->date|date|date_format:"%e %m %Y":"":"rus"}</p>
	
	<div itemprop="articleBody">{$post->text}</div>
</section>