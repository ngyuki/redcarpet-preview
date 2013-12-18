# coding: utf-8

require 'redcarpet'
require 'cgi'
require 'pygments'

module Highlight
  class Pygments < ::Redcarpet::Render::HTML

    def highlight(text, language)
      language = fix_language(language)
      opts = {:options => {:encoding => 'utf-8', :linenos => 'table'}}
      lexer = ::Pygments::Lexer.find(language)
      opts[:lexer] = lexer[:aliases].first if lexer
      ::Pygments.highlight(text, opts)
    rescue
      CGI.escapeHTML(text)
    end

    def block_code(text, language)
      language = fix_language(language)
      if language != nil
        '<div class="autoscroll">' + highlight(text, language) + '</div>'
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
