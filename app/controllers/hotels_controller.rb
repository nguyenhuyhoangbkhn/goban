class HotelsController < ApplicationController
  load_and_authorize_resource
  def index
  end

  def show
    @comment = @hotel.comments.new
  	@comments = @hotel.comments.page(params[:page]).per 10
  end
end
