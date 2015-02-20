function snippet(id, url, lang) {
    var code = '<div id="' + id + '">\n'
             +    '<script>\n'
             +      'function ' + id + '(response) {\n'
             +         'return github_callback("' + id + '", "' + lang + '")(response);\n'
             +      '}\n'
             +      'get_snippet("' + url + '?callback=' + id + '");\n'
             +    '</script>\n'
             + '</div>\n';
    $("#" + id).replaceWith(code);
}

function github_callback(id, language) {
    return function(response) {
        var safeCode = goog.html.SafeHtml.unwrap(goog.html.SafeHtml.from(new String(response.data))).trim();
        $("#" + id).html("<pre class='language-" + language + "'><code id='" + id + "-CodeElem'>" + safeCode + "</code></pre>");
        Prism.highlightElement($("#" + id + "-CodeElem")[0]);
    };
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
