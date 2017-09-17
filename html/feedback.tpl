
<section class="block contacts">
<h1>{$page->header|escape}</h1>

{$page->body}

</section>
<section class="block map">
	<div id="ymap"></div>
</section>
	{if $settings->ymapsml}
	<script src="http://api-maps.yandex.ru/2.0-stable/?load=package.full&lang=ru-RU" type="text/javascript"></script>	
	{literal}
	<script>
	$(document).ready(function() {		
            ymaps.ready(function () {
                var myMap = new ymaps.Map('ymap', {
                      /*  center: [55.734021, 37.710703], */
                        zoom: 17
                    }),
                    url = "{/literal}{$settings->ymapsml}{literal}"; 
				myMap.controls.add("zoomControl").add("mapTools").add('trafficControl');				
                ymaps.geoXml.load(url)
                     .then(function (res) {
                         myMap.geoObjects.add(res.geoObjects);
                     });
            })
	});	
	</script>
	{/literal}
	{/if}
