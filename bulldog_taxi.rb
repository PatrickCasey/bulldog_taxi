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

get '/index/confirmation' do
	erb :confirmation, locals: { master_hash: session['master_hash'] }
end

post '/' do
  rider_name = params[:name].to_s
  # session['master_array'].push rider_name
  # most_recent = { 'name' => params[:name].to_s,
  #                 'email' => params[:email].to_s,
  #                 'arrival_time' => params[:arrival_time] }
  session['master_hash'][rider_name] = { 'name' => params[:name].to_s,
                                     		 'email' => params[:email].to_s,
                                     		 'arrival_time' => params[:arrival_time] }
  erb :confirmation, locals: { master_hash: session['master_hash'] }
  # master_array = master_hash.to_a
  # most_recent = master_array.length
  redirect '/index/confirmation'
end

# get '/index/confirmation' do
# 	confirm = session['master_hash'][params[:most_recent]]['name']
# 	erb :confirmation, locals: { confirm: confirm }
# end

delete '/index/confirmation/:rider' do
  name = params[:rider]
  session['master_hash'].delete(name)
  erb :confirmation, locals: { master_hash: session['master_hash'] }
end

# get '/index/confirmation' do
# 	erb :confirmation
# end

# get '/confirmation' do
# 	session["masterhash"] ||= {}
# 	masterhash = session["masterhash"]
# 	erb :confirmation, :locals => {:masterhash => masterhash}
# end