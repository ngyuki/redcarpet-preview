# coding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), "helper"))
require 'lib/markdown'

class MarkdownTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def setup
  end

  def teardown
  end

  def test_to_html
    obj = Markdown.new
    assert_match /class/, obj.to_html("```rb\np 'x'\n```\n")
  end

  def _test_fix_language
    obj = Markdown.new
    assert_nil obj.fix_language(nil)
    assert_equal 'php', obj.fix_language('php')
    assert_equal 'php', obj.fix_language('php:index.php')
    assert_equal 'php', obj.fix_language('php:http://example.jp/')
  end
end
