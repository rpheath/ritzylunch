require File.join(Rails.root, "config/environment")
 
use Rails::Rack::LogTailer
run ActionController::Dispatcher.new