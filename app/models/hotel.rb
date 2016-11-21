class Hotel < ActiveRecord::Base
    has_many :images, dependent: :destroy
    has_many :comments, dependent: :destroy
    ratyrate_rateable "hotel"
    validates :name, presence: true, length: {maximum: 100}
    validates :introduction, presence: true, length: {maximum: 100000}
    validates :countRoom, presence: true
    validates :kind, presence: true
    validates :price, presence: true
    validates :phone_number, presence: true	
    validates :websitehotel, presence: true
    validates :address, presence: true
    
    delegate :village, :to => :address, :allow_nil => true
    scope :sorted_by_hotel_rating, ->{joins(:hotel_average).order('rating_caches.avg DESC')}
end
