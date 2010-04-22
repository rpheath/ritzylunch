class Admin::AuthorizedController < ApplicationController
  before_filter :login_required
end