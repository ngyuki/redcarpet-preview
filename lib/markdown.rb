# coding: utf-8

require 'redcarpet'
require 'lib/highlight/coderay'
require 'lib/highlight/pygments'
require 'lib/highlight/rouge'

class Markdown

  def initialize(engine = Highlight::Coderay.new)
    @highlight = SyntaxHighlight.new(engine)
  end

  def to_html(text)
    markdown = ::Redcarpet::Markdown.new(
      @highlight,
      :autolink => true,
      :space_after_headers => true,
      :fenced_code_blocks => true,
      :tables => true,
      :strikethrough => true,
      :superscript => true
    )
    text = markdown.render(text)
    "<div class=\"wiki\">#{text}</div>"
  end

  class SyntaxHighlight < ::Redcarpet::Render::HTML

    def initialize(engine)
      super()
      @engine = engine
    end

    def block_code(text, language)
      language = fix_language(language)
      if language != nil
        @engine.to_html(text, language)
      else
        "<pre>" + CGI.escapeHTML(text) + "</pre>"
      end
    rescue
      "<pre>" + CGI.escapeHTML(text) + "</pre>"
    end

    def block_quote(quote)
      "<blockquote>\n" << quote.gsub(/\n([^<])/,'<br>\1') << "</blockquote>\n"
    end

    def fix_language(language)
      return language.slice(/^[^\:]*/) if language != nil
      return language
    end
  end

end
