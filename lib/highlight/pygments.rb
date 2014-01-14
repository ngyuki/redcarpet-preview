# coding: utf-8

require 'redcarpet'
require 'pygments'

module Highlight
  class Pygments < ::Redcarpet::Render::HTML

    def highlight(text, language)
      opts = {:options => {:encoding => 'utf-8', :linenos => 'table'}}
      lexer = ::Pygments::Lexer.find(language)
      opts[:lexer] = lexer[:aliases].first if lexer
      ::Pygments.highlight(text, opts)
    end

    def to_html(text, language)
      '<div class="highlightwrap">' + highlight(text, language) + '</div>'
    end

    def css
      ::Pygments.css('.highlight')
    end

  end
end
