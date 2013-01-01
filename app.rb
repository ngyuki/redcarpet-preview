require 'rubygems'
require 'sinatra'
require './markdown'

if development?
  require 'sinatra/reloader'
end

helpers do
  def markdown(text)
    markdown = Markdown.new
    markdown.to_html text
  end
end

get '/' do
  redirect '/index.html'
end

post '/markdown/raw' do
  #response['Access-Control-Allow-Origin'] = '*'
  request.body.rewind
  markdown request.body.read
end
