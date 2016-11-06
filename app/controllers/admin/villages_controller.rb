class Admin::VillagesController < ApplicationController
  load_and_authorize_resource
  def index
    @villages = @villages.all.page(params[:page]).per 10
  end

  def show
  end

  def new
  end

  def create
    @village = Village.new village_params
    if @village.save
      flash[:success] = t "message.new_village_successful"
      redirect_to admin_villages_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @village.update_attributes village_params
      flash[:success] = t "message.edit_village_successful"
      redirect_to admin_villages_path
    else
      render "edit"
    end
  end

  def destroy
    if @village.destroy
      flash[:success] = t "message.delete_village_successful"
      redirect_to admin_villages_path
    else
      flash[:success] = t "message.delete_village_unsuccessful"
      redirect_to admin_villages_path
    end
  end
  
  def ajax
    
  end

  private
  def village_params
    params.require(:village).permit :name, :distric_id, :kind, :latitude, :longitude
  end
end