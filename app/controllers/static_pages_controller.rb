class StaticPagesController < ApplicationController
  def home
    @top_hotels_by_price = Hotel.all.sorted_by_price_rating.take 10
    @top_hotels_by_hotel = Hotel.all.sorted_by_hotel_rating.take 10
    @top_hotels_by_rate1 = Hotel.all.sorted_by_rate2_rating.take 10
    @top_hotels_by_rate2 = Hotel.all.sorted_by_rate2_rating.take 10
    @top_hotels_by_rate3 = Hotel.all.sorted_by_rate3_rating.take 10
  end
end
