# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require 'sinatra/flash'
require_relative 'lib/bomb'

enable :sessions

get '/' do
  erb :index
end

get '/bomb' do
  session[:bomb] = nil if session[:bomb]
  erb :bomb
end

post '/boot' do
  activation_code = params[:activation_code]
  deactivation_code = params[:deactivation_code]
  max_failed_deactivations = 3
  errors = validate_codes(activation_code, deactivation_code)

  if errors.empty?
    create_bomb(activation_code, deactivation_code, max_failed_deactivations)
    redirect '/inactive_bomb'
  else
    errors.map { |k, v| flash[k] = v }
    redirect '/bomb'
  end
end

get '/inactive_bomb' do
  return erb :inactive_bomb if bomb && bomb.inactive?
  redirect new_route
end

post '/activate' do
  bomb.enter_code(params[:activation_code])
  if bomb.active?
    redirect '/active_bomb'
  else
    flash[:error] = "Please enter in the correct code, yo!"
    redirect '/inactive_bomb'
  end
end

get '/active_bomb' do
  return erb :active_bomb if bomb && bomb.active?
  redirect new_route
end

post '/deactivate' do
  bomb.enter_code(params[:deactivation_code])
  if bomb.inactive?
    flash[:safe] = "You've Saved Megaton! For now..."
    redirect '/inactive_bomb'
  elsif bomb.active?
    flash[:uhoh] = "The Bomb Is Still Active!"
    redirect '/active_bomb'
  else
    redirect '/explosion'
  end
end

get '/explosion' do
  return erb :explosion if bomb && bomb.exploded?
  redirect new_route
end

not_found do
  status 404
  erb :please_stand_by
end

# we can shove stuff into the session cookie YAY!
def start_time
  session[:start_time] ||= (Time.now).to_s
end

def bomb
  session[:bomb]
end

def create_bomb(activation_code, deactivation_code, max_failed_deactivations)
  new_bomb = Bomb.new(activation_code, deactivation_code, max_failed_deactivations)
  session[:bomb] = new_bomb
end

def numeric?(code)
  !! /^\d+$/.match(code)
end

def empty?(code)
  code.empty?
end

def new_route
  return '/bomb' if !bomb
  return '/inactive_bomb' if bomb.inactive?
  return '/active_bomb' if bomb.active?
  return '/explosion' if bomb.exploded?
end

private

def validate_codes(activation_code, deactivation_code)
  errors = {}
  if empty?(activation_code) || empty?(deactivation_code)
    errors[:blank_input] = "Input must not be blank."
  end
  if !(numeric?(activation_code) && numeric?(deactivation_code))
    errors[:non_numeric] = "Codes can only be numeric."
  end
  if activation_code == deactivation_code
    errors[:duplicate] = "Codes must be different."
  end
  errors
end
