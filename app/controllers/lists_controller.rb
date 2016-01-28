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

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.properties = params[:list][:content]

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to "/users/#{current_user.id}"
  end

  private
    def list_params
      params.require(:list).permit(:id, :name, :properties => [])
    end
end
