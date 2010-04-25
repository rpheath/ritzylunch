class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.paginated(params[:page], :per_page => 15)
  end
end