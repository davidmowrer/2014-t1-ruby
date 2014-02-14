require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

#get "W/:x" do
#	y =params["x"]
#	id = z.find(y)
#  halt erb(:show)
#end

#get "W/:x" do
#	y =params["x"]
#	id = x.find(y)
#  halt erb(:show)
#end

# TODO: write handler for detail page route
