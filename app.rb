require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

configure :development, :test do
  require "pry"
end

Dir[File.join(File.dirname(__FILE__), "app", "**", "*.rb")].each do |file|
  require file
end

get "/" do
  "hello, world"
end
