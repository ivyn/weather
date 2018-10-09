require_relative "../services/weather_service"

class CitiesController < ApplicationController

  def view
    @cities = City.all
    # User passes in something
  	if params[:city] != nil
  	    if City.all.key?(params[:city].to_sym)
  	        @cities = {c: City.all[params[:city].to_sym]}
  	    end
  	end
  end

  def new
  end

  def create
    if !City.all.key?(params[:name].to_sym)
        city = City.new(
            name: params[:name],
            landmark: params[:landmark],
            population: params[:population]
        )
        # Save the city so that it's in City.all
        city.save
    end
    redirect_to :controller => 'cities', :action => 'view'
  end

  def update
    @city = City.all[params[:city].to_sym]
  end

  def postUpdate
    city = City.all[params[:city].to_sym]
    city.update(params)
    redirect_to :controller => 'cities', :action => 'view'
  end

end