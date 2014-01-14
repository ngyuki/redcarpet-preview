$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'rake/testtask'
require 'lib/highlight/coderay'
require 'lib/highlight/pygments'
require 'lib/highlight/rouge'

task :default => :test

Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

namespace :generate do

  desc "generate css files"
  task :css do

    File.open("public/css/coderay.highlight.css", "w") do |file|
      highlight = Highlight::Coderay.new
      file.write highlight.css
      puts "generate public/css/coderay.highlight.css"
    end

    File.open("public/css/pygments.highlight.css", "w") do |file|
      highlight = Highlight::Pygments.new
      file.write highlight.css
      puts "generate public/css/pygments.highlight.css"
    end

    File.open("public/css/rouge.highlight.css", "w") do |file|
      highlight = Highlight::Rouge.new
      file.write highlight.css
      puts "generate public/css/rouge.highlight.css"
    end

  end

end
