require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
   @error = nil
   halt erb(:login)
end

post "/login" do
  username = params["username"]
  password = params["password"]

  found_user = User.find_by(username: username)

  if found_user == nil
    flash.now[:error] = "Unknown username"
    halt erb(:login)
  elsif found_user.authenticate(password) == false
    flash.now[:error] = "Incorrect password"
    halt erb(:login)
  else
    session[:user_id] = found_user.id
    redirect "/welcome"
  end
end

get "/welcome" do
  user_id = session[:user_id]
  @user = User.find(user_id)
  halt erb(:welcome)
end

get "/logout" do
  session.clear
  redirect "/login"
end
