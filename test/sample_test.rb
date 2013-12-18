# coding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), "test_helper"))

require 'markdown'

class SampleTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def setup
  end

  def teardown
  end

  def test_highlight_coderay_fix_language
    obj = Highlight::Coderay.new
    assert_nil obj.fix_language(nil)
    assert_equal 'php', obj.fix_language('php')
    assert_equal 'php', obj.fix_language('php:index.php')
    assert_equal 'php', obj.fix_language('php:http://example.jp/')
  end

  def test_highlight_pygments_fix_language
    obj = Highlight::Pygments.new
    assert_nil obj.fix_language(nil)
    assert_equal 'php', obj.fix_language('php')
    assert_equal 'php', obj.fix_language('php:index.php')
    assert_equal 'php', obj.fix_language('php:http://example.jp/')
  end

end
