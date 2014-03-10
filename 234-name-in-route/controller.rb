require './davinci-sinatra.rb'

get "/" do
  @entries = EncyclopediaEntry.order(:word)
  halt erb(:index)
end

get "/:word" do
   word = params["word"]	
  @entry = EncyclopediaEntry.find_by!(word: word)
  halt erb(:show)
end

# TODO: write GET handler to serve show.html.erb with @entry set
# to the correct Encyclopedia Entry for routes like /albatross 
# and /jay
