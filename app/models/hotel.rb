class Hotel < ActiveRecord::Base
    belongs_to :address
    has_many :images, dependent: :destroy
    has_many :comments, dependent: :destroy
    ratyrate_rateable "hotel"
    validates :name, presence: true, length: {maximum: 100}
    validates :introduction, presence: true, length: {maximum: 100}
    validates :countRoom, presence: true
    validates :kind, presence: true
    validates :price, presence: true
    validates :phone_number, presence: true	
    validates :websitehotel, presence: true
end
