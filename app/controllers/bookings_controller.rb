class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Booking was created successfully!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was updated successfully!" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully removed!" }
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:room_id, :user_id, :start, :end, :purpose)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
