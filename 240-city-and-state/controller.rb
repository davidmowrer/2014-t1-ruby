require './davinci-sinatra.rb'

get "/" do
  @cities = City.order(:id)
  halt erb(:index)
end

get "/cities/:id" do
  name    = params["name"]
  @city = City.find_by(name: id)
  halt erb(:show)
end
