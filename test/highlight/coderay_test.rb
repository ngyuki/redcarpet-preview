# coding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), "..", "helper"))
require 'lib/highlight/coderay'

module Highlight
  class CoderayTest < Test::Unit::TestCase
    include Rack::Test::Methods

    def test_highlight
      obj = Highlight::Coderay.new
      assert_match /class/, obj.highlight("p 'hoge'", "rb")
    end

  end
end
