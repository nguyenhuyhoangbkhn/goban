class Admin::ProvincialsController < ApplicationController
  load_and_authorize_resource
  def index
    @provincials = @provincials.all.page(params[:page]).per 10
  end

  def show
  end

  def new
  end

  def create
    @provincial = Provincial.new provincial_params
    if @provincial.save
      flash[:success] = t "message.new_provincial_successful"
      redirect_to admin_provincials_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @provincial.update_attributes provincial_params
      flash[:success] = t "message.edit_provincial_successful"
      redirect_to admin_provincials_path
    else
      render "edit"
    end
  end

  def destroy
    if @provincial.destroy
      flash[:success] = t "message.delete_provincial_successful"
      redirect_to admin_provincials_path
    else
      flash[:success] = t "message.delete_provincial_unsuccessful"
      redirect_to admin_provincials_path
    end
  end

  private
  def provincial_params
    params.require(:provincial).permit :name
  end
end