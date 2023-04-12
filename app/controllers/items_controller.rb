class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @room = Room.find(params[:room_id])
    @item = @room.items.build
  end

  def edit
  end

  def create
    @room = Room.find(params[:room_id])
    @item = @room.items.build(item_params)

    if @item.save
      redirect_to room_path(@item.room), notice: "L'élement #{@item.name} a bien été ajouté à la pièce #{@room.name}."
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "L'élément #{@item.name} a bien été mis à jour."
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    redirect_to room_path(@item.room), notice: "L'élément #{@item.name} a bien été supprimé."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:name, :description)
  end

  def add_param
    @item = Item.find(params[:id])
    @item.item_params[params[:new_param_name]] = params[:new_param_value]
    if @item.save
      redirect_to item_path(@item), notice: 'New parameter added successfully.'
    else
      render :edit
    end
  end

end
