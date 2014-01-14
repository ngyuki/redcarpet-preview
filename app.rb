# coding: utf-8

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'sinatra'
require 'rubypython'
require 'lib/markdown'

if development?
  require 'sinatra/reloader'
  also_reload 'lib/**/*.rb'
end

RubyPython.configure python_exe: 'python2.6'

get '/' do
  redirect '/index.html'
end

post '/markdown/raw' do
  markdown = Markdown.new
  markdown.to_html request.body.read.force_encoding Encoding::UTF_8
end

post '/markdown/pygments' do
  markdown = Markdown.new(Highlight::Pygments.new)
  markdown.to_html request.body.read.force_encoding Encoding::UTF_8
end

post '/markdown/rouge' do
  markdown = Markdown.new(Highlight::Rouge.new)
  markdown.to_html request.body.read.force_encoding Encoding::UTF_8
end

get '/css/coderay.highlight.css' do
  content_type "text/css"
  highlight = Highlight::Coderay.new
  highlight.css
end

get '/css/pygments.highlight.css' do
  content_type "text/css"
  highlight = Highlight::Pygments.new
  highlight.css
end

get '/css/rouge.highlight.css' do
  content_type "text/css"
  highlight = Highlight::Rouge.new
  highlight.css
end
