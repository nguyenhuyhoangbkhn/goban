class Admin::AddressesController < ApplicationController
  load_and_authorize_resource
  def index
    @addresses = @addresses.all.page(params[:page]).per 10
  end

  def show
  end

  def new
  end

  def create
    @address = Address.new address_params
    if @address.save
      flash[:success] = t "message.new_address_successful"
      redirect_to admin_addresses_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @address.update_attributes address_params
      flash[:success] = t "message.edit_address_successful"
      redirect_to admin_addresses_path
    else
      render "edit"
    end
  end

  def destroy
    if @address.destroy
      flash[:success] = t "message.delete_address_successful"
      redirect_to admin_addresses_path
    else
      flash[:success] = t "message.delete_address_unsuccessful"
      redirect_to admin_addresses_path
    end
  end

  private
  def address_params
    params.require(:address).permit :building_name, :village_id, :distric_id, :provincial_id
  end
end