<div class="dialog">
{if $result}
	<h3 class="header"><a href="#" class="close" onclick="$.fancybox.close(); return false;">Закрыть</a>Запрос отправлен</h3>
	<p>Мы перезвоним вам по телефон {$phone} в обозначенное вами время.</p>
{else}
	<h3 class="header"><a href="#" class="close" onclick="$.fancybox.close(); return false;">Закрыть</a>Ошибка</h3>
	<p>{$error}</p>
{/if}
</div>