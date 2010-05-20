class TestimonialsController < ApplicationController
  caches_page :index
  
  def index
    @testimonials = Testimonial.all
  end
end