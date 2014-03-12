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
    @error = "Unknown username" 
    @old_usename = username
    halt erb(:login)
  elsif found_user.password != password
    @error = "Wrong passowrd"
    @old_username = username
    halt erb(:login)
  else
    session[:user_id] = found_user
    redirect "/accounts"
  end
 
 end
 
get "/accounts" do
  @user = session[:user_id] 
  halt erb(:accounts)
end

get "/location" do
  @user = session[:user_id] 
  halt erb(:location)
end

get "/rates" do
  @user = session[:user_id] 
  halt erb(:rates)
end

get "/logout" do
  session.clear
  redirect "/login"
end