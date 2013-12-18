# coding: utf-8

require 'redcarpet'
require 'lib/highlight/coderay'
require 'lib/highlight/pygments'

class Markdown
  def initialize(highlight = Highlight::Coderay.new)
    @highlight = highlight
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
end
