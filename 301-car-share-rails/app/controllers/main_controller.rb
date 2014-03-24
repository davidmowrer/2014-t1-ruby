class MainController < ApplicationController

  def home
  	redirect_to "/login" and return
  end

  def get_login
  	render :login and return
  end

  def  post_login	
    attempted_username = params["username"]
    attempted_password = params["password"]

    @member = Member.find_by(username: attempted_username)

    if @member == nil
      flash.now[:error] = "Unknown username"
      render :login and return
    elsif @member.authenticate(attempted_password) == false
      flash.now[:error] = "Incorrect password"
      render :login and return
    else
      session[:member_id] = @member.id
      redirect_to "/reservations" and return
    end
  end

  def get_reservations
    member_id = session[:member_id]
    @member = Member.find(member_id)
    @reserved_cars = @member.cars
    render :reservations and return
  end

  def post_reservations
    member_id = session[:member_id]
    member = Member.find(member_id)

    if params["commit"] == "Logout"
      redirect_to "/login" and return
    end

    Car.all.each do |car|
      if params["commit"] == "Return car #{car.id}"
        car.member_id = nil
        car.save!
      end
    end

    Car.all.each do |car|
      if params["commit"] == "Reserve car #{car.id}"
        car.member_id = member_id
        car.save!
      end
    end

    redirect_to "/reservations" and return
  end

end