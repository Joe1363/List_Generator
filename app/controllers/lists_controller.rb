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
    @list = List.find(params[:id])
  end

  def update
  @list = List.find(params[:id])

    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @list = current_user.lists.find(params[:id])
    @elements = @list.elements.order("order_number ASC")
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to "/users/#{current_user.id}"
  end

  private
    def list_params
      params.require(:list).permit(:id, :name, :properties => [], elements_attributes: [:id, :list_id, :order_number, :element_type, :content, :_destroy, list_items_attributes: [:id, :element_id, :order_number, :list_type, :content, :_destroy]])
    end
end
