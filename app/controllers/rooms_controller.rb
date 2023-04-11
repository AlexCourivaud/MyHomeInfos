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
      redirect_to rooms_path, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.delete
    redirect_to rooms_path, notice: 'Room was successfully destroyed.'
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name)
    end
end
