class HomeController < ApplicationController
  def index
    @microposts = Micropost.all.order(id: 'desc').page params[:page]
  end
end
