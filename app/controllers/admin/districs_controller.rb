class Admin::DistricsController < ApplicationController
  load_and_authorize_resource
  def index
    @districs = @districs.all.page(params[:page]).per 10
  end

  def show
  end

  def new
  end

  def create
    @distric = Distric.new distric_params
    if @distric.save
      flash[:success] = t "message.new_distric_successful"
      redirect_to admin_districs_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @distric.update_attributes distric_params
      flash[:success] = t "message.edit_distric_successful"
      redirect_to admin_districs_path
    else
      render "edit"
    end
  end

  def destroy
    if @distric.destroy
      flash[:success] = t "message.delete_distric_successful"
      redirect_to admin_districs_path
    else
      flash[:success] = t "message.delete_distric_unsuccessful"
      redirect_to admin_districs_path
    end
  end

  private
  def distric_params
    params.require(:distric).permit :name, :provincial_id, :kind, :latitude, :longitude
  end
end