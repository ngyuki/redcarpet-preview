# coding: utf-8

require 'redcarpet'
require 'cgi'
require 'coderay'

module Highlight
  class Coderay < ::Redcarpet::Render::HTML

    def highlight(text, language)
      language = fix_language(language)
      CodeRay.scan(text, language).html(:line_numbers => :inline, :line_number_anchors => false, :wrap => :span)
    rescue
      CGI.escapeHTML(text)
    end

    def block_code(text, language)
      language = fix_language(language)
      if language != nil
        "<pre><code class='#{language} syntaxhl'>" + highlight(text, language) + "</code></pre>"
      else
        "<pre>" + CGI.escapeHTML(text) + "</pre>"
      end
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
