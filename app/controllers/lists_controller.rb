class ListsController < ApplicationController
  before_action :authenticate_user!, :except => [:main]

  def main
    if user_signed_in?
      redirect_to '/users/index'
    end
  end

  def new
    @list = List.new 
  end

end
