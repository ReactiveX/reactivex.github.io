module Jekyll
  class LangOperatorTag < Liquid::Block
    #include TemplateWrapper
    def initialize(tag_name, title, tokens)
      super
      @title = title.strip!
      @title = @title.gsub(".", "")
      @title = @title.gsub(" ", "")
    end

    def render(context)
      body = super
      output = "
      <div class=\"panel panel-default\">
        <div class=\"panel-heading\" role=\"tab\" id=\"heading#{@title}\">
          <h4 class=\"panel-title\">
            <a data-toggle=\"collapse\" data-parent=\"\#accordion\" href=\"\#collapse#{@title}\" aria-expanded=\"true\" aria-controls=\"collapse#{@title}\">
              #{@title}
            </a>
          </h4>
        </div>
        <div id=\"collapse#{@title}\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"heading#{@title}\">
          <div class=\"panel-body\">
            #{body}
          </div>
        </div>
      </div>
      "
      #output = safe_wrap(output)
      output
    end
  end
end

Liquid::Template.register_tag('lang_operator', Jekyll::LangOperatorTag)
