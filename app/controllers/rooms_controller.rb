class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @item = Item.new
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path, notice: "La pièce #{@room.name} a bien été ajoutée."
    else
      redirect_to rooms_path, notice: 'Ne peut être vide'
    end
  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path, notice: "La pièce #{@room.name} a été mise à jour."
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.delete
    redirect_to rooms_path, notice: "La pièce #{@room.name} a bien été supprimée."
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name)
    end
end
