ENV['RACK_ENV'] = 'test'

require 'test/unit'
require 'rack/test'

$LOAD_PATH.unshift(File.expand_path('..', File.dirname(__FILE__)))
