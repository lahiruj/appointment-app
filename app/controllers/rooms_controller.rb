class RoomsController < ApplicationController
  before_action :find_room, only: %i[show]

  def index
    @rooms = Room.all
  end

  def show
  end

  private

  def find_room
    @room = Room.find(params[:id])
  end
end
