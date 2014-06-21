---
layout: default
title: ReactiveX - Embed Test
id: embedding
---

#Embedding Code

<script>
	
	function github_callback(id, language) { 
		return function(response) {
			var safeCode = goog.html.SafeHtml.unwrap(goog.html.SafeHtml.from(new String(response.data)));
			$("#" + id).html("<pre class='language-" + language + "'><code id='" + id + "-CodeElem'>" + safeCode + "</code></pre>");
			Prism.highlightElement($("#" + id + "-CodeElem")[0]);
		};
	}

	function show_code(response) {
		return github_callback("foobar", "java")(response);
	}

	function get_snippet(url) {
		$.ajax({
		    url: url,
		    headers: {
		    	Accept: "application/vnd.github.3.raw; charset=utf-8",
		    	"Content-Type": "application/vnd.github.3.raw; charset=utf-8"
			},
		    context: document.body,
		    success: function() {}
		});
	}

	get_snippet("https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/Flatmap.java?callback=show_code");
	
</script>

<div id="foobar"></div>