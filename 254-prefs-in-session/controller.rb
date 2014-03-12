require './davinci-sinatra.rb'

get "/" do
  	@color  = session[:color]
  	@letter = session[:letter]
    @number = session[:number]
  	halt erb(:index)
  	end

post "/" do
  	color  = params["color"]
  	letter = params["letter"]
 	number = params["number"]

   	session[:color]  = color
   	session[:letter] = letter
   	session[:number] = number
  	redirect "/"
end

get "/logout" do
	session.clear
	redirect "/"
end

