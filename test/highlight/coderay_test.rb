# coding: utf-8

require File.expand_path('../helper', File.dirname(__FILE__))
require 'lib/highlight/coderay'

module Highlight
  class CoderayTest < Test::Unit::TestCase

    def test_highlight
      obj = Highlight::Coderay.new
      assert_match /class/, obj.highlight("p 'hoge'", "rb")
    end

  end
end
