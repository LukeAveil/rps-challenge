require 'sinatra/base'

class Rps < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
  	session[:player_name] = params[:player_name]
  	redirect '/play'
  end

  get '/play' do
  	@player_name = session[:player_name]
  	erb :play
  end

  post '/weapon' do
  	session[:player_weapon] = params[:player_weapon]
  	redirect '/game'
  end

  get '/game' do
  	@player_name = session[:player_name]
  	@player_weapon = session[:player_weapon]
  	erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

