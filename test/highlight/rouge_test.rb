# coding: utf-8

require File.expand_path('../helper', File.dirname(__FILE__))
require 'lib/highlight/rouge'

module Highlight
  class RougeTest < Test::Unit::TestCase

    def test_highlight
      obj = Highlight::Rouge.new
      assert_match /class/, obj.highlight("p 'hoge'", "rb")
    end

  end
end
