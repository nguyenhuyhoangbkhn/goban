class Distric < ActiveRecord::Base
    belongs_to :provincial
    validates :name, presence: true, length: {maximum: 100}
end
