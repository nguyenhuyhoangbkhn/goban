class Distric < ActiveRecord::Base
    belongs_to :provincial
    has_many :villages, dependent: :destroy
    validates :name, presence: true, length: {maximum: 100}
end
