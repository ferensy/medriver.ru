<!DOCTYPE html>
<!-- this is new theme -->
<html itemscope itemtype="http://schema.org/WebPage">
<head>
	<base href="{$config->root_url}/"/>
	<title>{$meta_title|escape}</title>	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="{$meta_description|escape}" />
	<meta name="keywords" content="{$meta_keywords|escape}" />
    <meta itemprop="name" content="{$meta_title|escape}"/>
    <meta itemprop="description" content="{$meta_description|escape}"/>	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
	<meta name="viewport" content="width=960,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
        <meta name='yandex-verification' content='68f9c1130d0cdb9e' />
        <meta name="google-site-verification" content="AKZ-u2h0zBGsJW26EQjQ9JpVN1-7BZ93Q1T-_ldYrQc" />
	<link href="design/{$settings->theme|escape}/css/style.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="design/{$settings->theme|escape}/images/favicon.ico" rel="icon" type="image/x-icon"/>
	<link href="design/{$settings->theme|escape}/images/favicon.ico" rel="shortcut icon" type="image/x-icon"/>
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="white" />	
	<link rel="stylesheet" href="js/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
	<script src="js/jquery/jquery.js"  type="text/javascript"></script>	
	<!--[if IE]>
	<link href="design/{$settings->theme|escape}/css/ie.css" rel="stylesheet" type="text/css" />
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/iepngfix_tilebg.js"></script>	
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/rounded-corners-min.js"></script>		
	<![endif]-->
	<script src="design/{$settings->theme}/js/jquery-ui.min.js"></script>
	<script src="design/{$settings->theme}/js/jquery.mousewheel.js"></script>	
	<script src="design/{$settings->theme}/js/mwheelIntent.js"></script>
	<script src="design/{$settings->theme}/js/accounting.js"></script>
	<script src="design/{$settings->theme}/js/jquery.jscrollpane.min.js"></script>	
	<script src="design/{$settings->theme}/js/js.js"></script>	
	<script src="design/{$settings->theme}/js/ajax_cart.js"></script>	
	<script src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>
        
    
</head>
<body>

	<header>
		<div id="header">
			<div class="search">
				<aside>
					<form action="products">
						<input class="input_search" type="text" name="keyword" value="{$keyword|escape}" placeholder="Поиск..."/>
						<input class="button_search" value="Искать" type="submit" />
					</form>				
				</aside>
			</div>
			<div class="cart" id="cart_informer">
				{include file='cart_informer.tpl'}				
			</div>
		</div>
		<div class="wrap">
                             
                <div itemscope itemtype="http://schema.org/Organization">
                 <span itemprop="name" id="logo"><a href="./">МедРивер</a></span>
			<div class="vcard">
				<div class="phones">
                                <span itemprop="telephone">
					<p class="phone tel" title="+78123844718">812 <strong>384-47-18</strong></p>
					<p class="phone tel" title="+79112589194">911 <strong>258-91-94</strong></p>
                                 </span>
				</div>
				<div class="links">
					<p><a href="#call" class="ajax">Заказать обратный звонок</a></p>
                                        <p><!--<a href="#" onclick="LiveTex.openWelcomeWindow()">-->Онлайн консультант<!--</a>--></p>
				</div>
				<div class="contacts">
                               
					<p class="ico icq">691-376-725</p>
                                <span itemprop="email">
					<p class="ico email">med-river@yandex.ru</p>
                                 </span>
				</div>
				<div class="workhours">
					<p>Время работы:</p>
					<p>пн-пт с 9:00 до 18:00</p>
				</div>
			</div>			
			<nav class="corner shadow rc10">
				<ul>
				{foreach $pages as $p}
					{if $p->menu_id == 1}
					<li class="{$p->url} {if $page && $page->id == $p->id}selected{/if} {if $p@last}last{/if} {if $p@first}first{/if}">
						<a href="{$p->url}/" class="tshadow">
							{$p->name|escape}
						</a>
					</li>
					{/if}
				{/foreach}
				</ul>
			</nav>
        	 </div>
		</div>			
		<p class="clear"></p>
	</header>
	{if $module=='MainView'}
		{get_featured_products var=featured_products limit=4}
		{if $featured_products}
		<section id="hits" class="products">
			<ul class="products">
				{foreach $featured_products as $product}
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
		</section>
		{/if}
	{/if}
	<section id="content">
        
         
		<div id="cols" {if $cols!='none'}class="left-col"{/if}>
			{if $cols!='none'}
			<aside class="left">
				<section class="block catalog corner shadow rc10">
					<h3>КАТАЛОГ ПРОДУКЦИИ</h3>
					{function name=categories_tree}
					{if $categories}
					<ul class="corner rc10">
					{foreach $categories as $c}
						{* Показываем только видимые категории *}
						{if $c->visible}
							<li class="li{if $c->subcategories} has-sub{/if}{if $c@last} last{/if}">
								<a {if $category->id == $c->id}class="selected"{/if} href="catalog/{$c->url}/" data-category="{$c->id}">{$c->name}</a>
								{categories_tree categories=$c->subcategories}
							</li>
						{/if}
					{/foreach}
					</ul>
					{/if}
					{/function}
					{if $category}
						{categories_tree categories=$category->subcategories}					
					{else}
						{categories_tree categories=$categories}					
					{/if}
				</section>				
				{if $module!='MainView'}
				{get_featured_products var=featured_product limit=1 sort=rand}
				{if $featured_product}
				<section class="block products">
					<ul class="products">
						{foreach $featured_product as $product}
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
													<input name="amount" value="1" type="text" min="1"/>
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
				</section>				
				{/if}
				{/if}
                                <!--грипп-->
                         <a href="http://medriver.ru/catalog/obluchatel-recirculator"><img src="files/products/gripp.gif"></a>
                         <a href="http://medriver.ru/products/konzentrator7F-3L"><img src="files/products/kontz.jpg"></a>
			</aside>
			{/if}
                        <section class="center">
				{$content}	
			</section>
						
		</div>
	</section>
	<footer>
		<div class="wrap">
		<div class="left">
			<ul>
			{foreach $pages as $p}
				{* Выводим только страницы из первого меню *}
				{if $p->menu_id == 1}
				<li class="{$p->url} {if $page && $page->id == $p->id}selected{/if}">
					<a href="{$p->url}/">
						{$p->name|escape}
					</a>
				</li>
				{/if}
			{/foreach}
			</ul>		
		</div>
		<div class="right">
			<p class="copy">&copy; 2014. OOO «МедРивер». Все права защищены</p>
			<p>Разработка сайтов — <a href="http://formulasaitov.ru/" target="_blank" rel="nofollow">Формула сайтов</a></p>
		</div>
		<div class="center">
			{literal}
                        <!-- Yandex.Metrika informer -->
<a href="https://metrika.yandex.ru/stat/?id=24172222&amp;from=informer"
target="_blank" rel="nofollow"><img src="//bs.yandex.ru/informer/24172222/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" onclick="try{Ya.Metrika.informer({i:this,id:24172222,lang:'ru'});return false}catch(e){}"/></a>
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter24172222 = new Ya.Metrika({id:24172222,
                    webvisor:true,
                    clickmap:true,
                    accurateTrackBounce:true,
                    ut:"noindex"});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/24172222?ut=noindex" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

                 <!--/Google Analytics counter-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-57267682-1', 'auto');
  ga('send', 'pageview');

</script>
                 <!--/Google Analytics counter-->
			{/literal}	
		</div>
		</div>
		<p class="clear"></p>
	</footer>
	<div class="none">
		<div id="call" class="dialog">
			<form action="ajax/feadback.php" method="post" class="ajaxform">
				<h3 class="header"><a href="#" class="close" onclick="$.fancybox.close();  return false;">Закрыть</a>Заказ обратного звонка</h3>
				<input type="hidden" name="message" value="Обратный звонок" />
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
{literal}	
{/literal}	
	<!--<section id="content">
		<h1 style="margin-top: 300px;">Рады видеть Вас на сайте Медривер! Наш телефон (812) 384-47-18</h1>
        </section>-->
        <!-- begin of Top100 code -->

<script id="top100Counter" type="text/javascript" src="http://counter.rambler.ru/top100.jcn?3078151"></script>
<noscript>
<a href="http://top100.rambler.ru/navi/3078151/" rel="nofollow">
<img src="http://counter.rambler.ru/top100.cnt?3078151" alt="Rambler's Top100" border="0" />
</a>

</noscript>
<!-- end of Top100 code -->
</body>
</html>