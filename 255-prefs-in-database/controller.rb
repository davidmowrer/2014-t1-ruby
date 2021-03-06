require './davinci-sinatra.rb'

get "/" do
  if session[:user_id] != nil
    @user = User.find(session[:user_id])
  else
    @user = User.new
  end
  halt erb(:index)
end

post "/" do
  if session[:user_id] != nil
    @user = User.find(session[:user_id])
  else
    @user = User.new
  end

  @user.color  = params["color"]
  @user.letter = params["letter"]
  @user.number = params["number"]

  @user.save!
  redirect "/"
end

get "/logout" do
  session.clear
  redirect "/"
end
