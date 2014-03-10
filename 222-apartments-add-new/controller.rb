require './davinci-sinatra.rb'

get "/" do
  @apartments = Apartment.all
  halt erb(:index)
end

post "/" do
  @apartment                 = Apartment.new
  @apartment.address         = params["address"]
  @apartment.rent_per_month  = params["rent"]
  @apartment.does_allow_pets = params["pets"]
  @apartment.url             = params["url"]
  @apartment.save!
  redirect "/"
end

post "/apartments/:id" do
	id                          = params["id"]
	apartment                   = Apartment.find(id)
	appartment.address          = params["address"]
	appartment.rent_per_month   = params["rent"]
	appartment.does_allow_pets  = params["pets"]
	appartment.url              = params["url"]
	message save!
	redirect "/"
end
