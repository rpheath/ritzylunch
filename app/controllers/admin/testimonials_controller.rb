class Admin::TestimonialsController < Admin::AuthorizedController
  restful_controller :redirect_to => :admin_testimonials_path
end