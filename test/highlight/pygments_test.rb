# coding: utf-8

require File.expand_path('../helper', File.dirname(__FILE__))
require 'lib/highlight/pygments'

module Highlight
  class PygmentsTest < Test::Unit::TestCase

    def test_highlight
      obj = Highlight::Pygments.new
      assert_match /class/, obj.highlight("p 'hoge'", "rb")
    end

  end
end
