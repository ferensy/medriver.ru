<div class="dialog">
{if $result}
	<h3 class="header"><a href="#" class="close" onclick="$.fancybox.close(); return false;">Закрыть</a>Заявка оформлена</h3>
	<p>Ваша заявка принята. В ближайшее время мы свяжемся с Вами для уточнения деталей</p>
{else}
	<h3 class="header"><a href="#" class="close" onclick="$.fancybox.close(); return false;">Закрыть</a>Ошибка</h3>
	<p>{$error}</p>
{/if}
</div>