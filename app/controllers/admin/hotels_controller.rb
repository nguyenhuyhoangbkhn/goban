class Admin::HotelsController < ApplicationController
  load_and_authorize_resource
  def index
    @hotels = @hotels.all.page(params[:page]).per 10
    @search = @hotels.all.ransack params[:q]
    if params[:q].nil?
      @hotels = @hotels.page(params[:page]).per 10
    else
      @hotels = @search.result.page(params[:page]).per 10
    end
  end

  def show
  end

  def new
  end

  def create
    @hotel = Hotel.new hotel_params
# nham fordel thao nao :3
    if @hotel.save
      unless params[:images].nil?
        params[:images][:picture].each do |a|
          @hotel.images.create!(picture: a)
        end
      end
      flash[:success] = t "message.new_hotel_successful"
      redirect_to admin_hotels_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @hotel.update_attributes hotel_params
      flash[:success] = t "message.edit_hotel_successful"
      redirect_to admin_hotels_path
    else
      render "edit"
    end
  end

  def destroy
    if @hotel.destroy
      flash[:success] = t "message.delete_hotel_successful"
      redirect_to admin_hotels_path
    else
      flash[:success] = t "message.delete_hotel_unsuccessful"
      redirect_to admin_hotels_path
    end
  end

  private
  def hotel_params
    params.require(:hotel).permit :name, :introduction, :countRoom, :kind,
      :address, :price, :phone_number, :websitehotel, :images, :building_name
  end
end