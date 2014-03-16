require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/:login" do
  @error = nil
  halt erb(:login)
end

post "/login" do
  username = params["username"]
  password = params["password"]

  found = User.find_by(username: username)

  if found == nil
    flash[:error] = "Unknown username."
    redirect "/:login"
  elsif found.authenticate(password) == false
    flash[:error] = "Incorrect password."
    redirect "/login"
  else
    session[:user_id] = found.id
    flash[:success] = "You have successfully logged in"
    redirect "/welcome"
  end 
end 

get "/:welcome" do
  user_id = session[:user_id]
  @user = User.find(user_id)
  halt erb(:welcome)
end

get "/:logout" do
  session.clear
  flash[:success] = "You have successfully logged out"
  redirect "/login"
end
