require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/users/new" do
  @user = User.new
  halt erb(:new)
end

post "/users/new" do
  @user = User.new
  @user.username              = params["username"]
  @user.password              = params["password"]
  @user.password_confirmation = params["password_confirmation"]

  if @user.save == true
    redirect "/login"
  else
    halt erb(:new)
      end

end

get "/login" do
  halt erb(:login)
end

post "/login" do
  username = params["username"]
  password = params["password"]
 
  found_user = User.find_by(username: username)

  if found_user == nil 
    @message = "Unknown username"
    halt erb(:login)
  elsif found_user.authenticate(password) == false  
    @message = "Incorrect password"
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
