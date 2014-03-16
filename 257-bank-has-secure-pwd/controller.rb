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
    halt erb(:login)
  elsif found_user.authenticate(password) == false  
    @error = "Incorrect password"
    halt erb(:login)
  else
    session[:user_id] = found_user.id
    redirect "/accounts"
  end 

end

get "/accounts" do
  @user = User.find_by(id: session[:user_id])
  halt erb(:accounts)
end

get "/location" do
  @user = User.find_by(id: session[:user_id])
  halt erb(:location)
end

get "/rates" do
  @user = User.find_by(id: session[:user_id])
  halt erb(:rates)
end

get "/logout" do
  session.clear
  redirect "/login"
end
