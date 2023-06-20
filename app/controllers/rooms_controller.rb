class RoomsController < ApplicationController
  before_action :find_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destory
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :capacity)
  end

  def find_room
    @room = Room.find(params[:id])
  end
end
