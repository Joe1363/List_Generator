class ListsController < ApplicationController
  before_action :authenticate_user!, :except => [:main]

  def main
    if user_signed_in?
      redirect_to "/users/#{current_user.id}"
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
1/0
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

  def edit
  end

  def update
  end

  def show
    @list = current_user.lists.find(params[:id])
    @elements = @list.properties
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to "/users/#{current_user.id}"
  end

  private
    def list_params
      params.require(:list).permit(:id, :name, :properties => [], elements_attributes: [:id, :list_id, :order_number, :type, :content])
    end
end
