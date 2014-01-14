# coding: utf-8

require 'redcarpet'
require 'rouge'

module Highlight
  class Rouge

    def highlight(text, language)
      formatter = ::Rouge::Formatters::HTML.new(
        :css_class => 'highlight',
        :line_numbers => true,
        :wrap => true,
      )
      lexer = ::Rouge::Lexer.find(language) || ::Rouge::Lexers::PlainText
      lexer = lexer.new(:start_inline => true) # for PHP
      ::Rouge.highlight(text, lexer, formatter)
    end

    def to_html(text, language)
      '<div class="highlightwrap">' + highlight(text, language) + '</div>'
    end

    def css
      ::Pygments.css('.highlight')
    end

  end
end
