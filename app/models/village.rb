class Village < ActiveRecord::Base
  belongs_to :distric
  has_many :addresses, dependent: :destroy
  validates :name, presence: true, length: {maximum: 100}
end
