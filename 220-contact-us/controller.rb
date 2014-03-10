require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

post "/" do
	message           = Message.new
	message subject   = params["subject"]
	message body      = params["body"]
	message save!
	redirect "/"
end

post "/message/:id" do
	id                = params["id"]
	message           = Message.find(id)
	message subject   = params["subject"]
	message body      = params["body"]
	message save!
	redirect "/"
end