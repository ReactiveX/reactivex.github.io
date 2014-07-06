---
layout: default
title: ReactiveX - Embed Test
id: embedding
---

#Embedding Code

<script>
var data = {"snippets":[
{"Java":"https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/HeadTail.java"},
{"Scala":"https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/Gui.java"},
{"Groovy":"https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/Flatmap.java"},
{"Clojure":"https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/Game.java"},
{"Kotlin":""},
{"JRuby":""}
]};
</script>

<tabs-panel data='{{ data }}' flex></tabs-panel>

<!--tabs-panel data='{"employees":[
    {"firstName":"John", "lastName":"Doe"}, 
    {"firstName":"Anna", "lastName":"Smith"},
    {"firstName":"Peter", "lastName":"Jones"}
]}' flex></tabs-panel-->

<!--paper-tabs selected="0" class="transparent-teal" noink>
	<paper-tab>Java</paper-tab>
	<paper-tab>Scala</paper-tab>
	<paper-tab>Groovy</paper-tab>
	<paper-tab>Clojure</paper-tab>
	<paper-tab>Kotlin</paper-tab>
	<paper-tab>JRuby</paper-tab>
</paper-tabs>

<script>
	var tabs = document.querySelector('paper-tabs');
	alert(tabs);
	//var list = document.querySelector('post-list');
	//alert(list);
	tabs.addEventListener('core-select', function() {
	  //list.show = tabs.selected;
	  alert("event fired");
	});
</script-->

<br/>

<hr/>

<!--code-snippet url="https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/HeadTail.java" language="java"></code-snippet>
blabalbla
<hr/>
<code-snippet url="https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/HeadTail.java" language="java"></code-snippet>

<hr/-->
