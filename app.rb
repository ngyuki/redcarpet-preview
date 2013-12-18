# coding: utf-8

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'sinatra'
require 'rubypython'
require 'lib/markdown'

if development?
  require 'sinatra/reloader'
  also_reload 'lib/**/*.rb'
end

RubyPython.configure python_exe: 'python2.6'

helpers do
  def markdown(text)
    markdown = Markdown.new
    markdown.to_html text
  end

  def markdown_pygments(text)
    markdown = Markdown.new(Highlight::Pygments.new)
    markdown.to_html text
  end
end

get '/' do
  redirect '/index.html'
end

post '/markdown/raw' do
  markdown request.body.read.force_encoding Encoding::UTF_8
end

post '/markdown/pygments' do
  markdown_pygments request.body.read.force_encoding Encoding::UTF_8
end
