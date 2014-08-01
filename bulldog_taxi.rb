require 'sinatra'
#require 'sinatra/reloader'

configure do
	enable :sessions
end

before do
	session['master_hash'] ||= {}
end

# before do
# 	session['most_recent'] ||= {}
# end

get '/' do
	erb :index
end