require './davinci-sinatra.rb'

get "/" do
  @patients = Patient.order(:id)
  halt erb(:index)
end

get "/patients/:id" do
  id       = params["id"]
  @patient = Patient.find(id)
  halt erb(:edit)
end

post "/patients/:id" do
  id                 = params["id"]
  @patient           = Patient.find(id)
  @patient.systolic  = params["systolic"]
  @patient.diastolic = params["diastolic"]

  if params["commit"] == "Save"
    @patient.save!
     redirect "/"
  elsif params["commit"] == "Delete"
    @patient.destroy
  end

end
