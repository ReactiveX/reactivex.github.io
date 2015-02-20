require 'uri'
require 'cgi'
require 'SecureRandom'

module Jekyll
  class SnippetTag < Liquid::Tag
    def initialize(tag_name, params, tokens)
      super
      parts = params.split(",").map(&:strip)
      @url = parts[0]
      @lang = parts[1]
    end

    def render(context)
      id = "f" + SecureRandom.uuid.gsub("-", "_")
      %|<div id="#{id}">
        <script>
          function #{id}(response) {
            return github_callback("#{id}", "#{@lang}")(response);
          }
          get_snippet("#{@url}?callback=#{id}");
        </script>
      </div>|
    end
  end
end

Liquid::Template.register_tag('snippet', Jekyll::SnippetTag)
