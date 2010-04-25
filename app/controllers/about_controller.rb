class AboutController < ApplicationController
  def index
    @about = About.only
  end
end