class MainController < ApplicationController

	def home
	  @goats = RacingGoat.all
	  render :index and return
	end

	def get_new_goat
		@goat = RacingGoat.new
		render :edit and return
	end

	def post_new_goat
	  @goat                    = RacingGoat.new
	  @goat.name               = params["name"]
	  @goat.gender             = params["gender"]
	  @goat.best_100m_time     = params["best_100m_time"]
	  @goat.dietary_preference = params["dietary_preference"]
	 
	  if @goat.save == true
	    flash[:notice] = "Record has been created."
	    redirect_to "/" and return
	  else
	    render :edit and return
	  end 
	 end 

	def get_goats
		id = params["id"]
		@goat = RacingGoat.find(id)
	    render :edit and return
	end

	def post_goats
	  	id = params["id"]
	 	@goat = RacingGoat.find(id)
	 
	 	if params["commit"] == "Save"
	   	    @goat.name               = params["name"]
		    @goat.gender             = params["gender"]
		    @goat.best_100m_time     = params["best_100m_time"]
		    @goat.dietary_preference = params["dietary_preference"]
	    
		    if @goat.save == true
		        flash[:notice] = "Record has been updated."
		      	redirect_to "/" and return
		    else 
		        render :edit and return
		    end 

		elsif params["commit"] == "Delete"
		    @goat.destroy
		    flash[:notice] = "Record has been deleted."
		    redirect_to "/" and return
		end 
	end 
end