---
layout: default
title: ReactiveX - Embed Test
id: embedding
---

#Embedding Code

<script>

    function escapeHtml(unsafe) {
	    return unsafe
	        .replace(/&/g, "&amp;")
	        .replace(/</g, "&lt;")
	        .replace(/>/g, "&gt;")
	        .replace(/"/g, "&quot;")
	        .replace(/'/g, "&#039;");
	}
	
	function foo1(id) { 
		return function(response) {
			console.log(response.data);
			console.log(id);
			$("#foobar").html("<pre class='language-javascript'><code id='" + id + "'>" + escapeHtml(response.data) + "</code></pre>");
			Prism.highlightElement($("#" + id)[0]);
			Prism.highlightAll();
		}
	}

	function foo2(response) { 
		return foo1("foobar")(response);
	}

	function get_snippet(url) {
		$.ajax({
		    url: url,
		    headers: {
		    	Accept: "application/vnd.github.3.raw; charset=utf-8",
		    	"Content-Type": "application/vnd.github.3.raw; charset=utf-8"
			},
		    context: document.body,
		    success: function() {
		      //alert("done");
		    }
		});
	}

	get_snippet("https://api.github.com/repos/GeorgiKhomeriki/RxCourse/contents/Flatmap.java?callback=foo2");
</script>

<div id="foobar"></div>