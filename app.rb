# coding: utf-8

$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))

require 'sinatra'
require 'lib/markdown'

if development?
  require 'sinatra/reloader'
  also_reload 'lib/**/*.rb'
end

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
