class LocationController < ApplicationController
  def index
    render
  end
  
  def directions
    @result = Direction.new(params).to_s
  end
end