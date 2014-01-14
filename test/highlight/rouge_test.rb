# coding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), "..", "helper"))
require 'lib/highlight/rouge'

module Highlight
  class RougeTest < Test::Unit::TestCase
    include Rack::Test::Methods

    def test_highlight
      obj = Highlight::Rouge.new
      p obj.highlight("p 'hoge'", "rb")
      assert_match /class/, obj.highlight("p 'hoge'", "rb")
    end

  end
end
