---
layout: default
title: ReactiveX - Embed Test
id: embedding
---

#Embedding Code

<div id="codeSample">
	<script>

		function codeSample(response) {
			return github_callback("codeSample", "java")(response);
		}

		get_snippet("https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/Flatmap.java?callback=codeSample");
		
	</script>
</div>

<br/>

hello world

<div id="codeSample2">
	<script>

		function codeSample2(response) {
			return github_callback("codeSample2", "java")(response);
		}

		get_snippet("https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/Flatmap.java?callback=codeSample2");
		
	</script>
</div>
