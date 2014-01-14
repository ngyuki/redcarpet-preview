# coding: utf-8

require 'redcarpet'
require 'coderay'

module Highlight
  class Coderay < ::Redcarpet::Render::HTML

    def highlight(text, language)
      CodeRay.scan(text, language).html(
        :line_numbers => :table,
        :line_number_anchors => false
      )
    end

    def to_html(text, language)
      '<div class="highlightwrap">' + highlight(text, language) + '</div>'
    end

    def css
      ::CodeRay::Encoders::HTML::CSS.new(:default).stylesheet
    end

  end
end
