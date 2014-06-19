require 'sinatra'
require 'sinatra/reloader'

configure do
	enable :sessions
end

before do
	session['masterhash'] ||= {}
end

get '/' do
	test = "testing"
	erb :index, :locals => { :test => test }
end

get '/confirmation' do
	test = "testing"
	erb :confirmation, :locals => { :test => test }
end

# get '/confirmation' do
# 	session["masterhash"] ||= {}
# 	masterhash = session["masterhash"]
# 	erb :confirmation, :locals => {:masterhash => masterhash}
# end