# coding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), "..", "helper"))
require 'lib/highlight/pygments'

module Highlight
  class PygmentsTest < Test::Unit::TestCase
    include Rack::Test::Methods

    def test_highlight
      obj = Highlight::Pygments.new
      assert_match /class/, obj.highlight("p 'hoge'", "rb")
    end

  end
end
