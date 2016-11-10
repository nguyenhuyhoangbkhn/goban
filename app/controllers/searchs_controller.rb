class SearchsController < ApplicationController
  def index
    @hotels = Hotel.all
    @search = @hotels.ransack params[:q]
    if params[:q].nil?
      @hotels = @hotels.page(params[:page]).per 10
    else
      @hotels = @search.result.page(params[:page]).per 10
    end
  end
end