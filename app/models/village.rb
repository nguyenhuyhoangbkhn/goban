class Village < ActiveRecord::Base
  belongs_to :distric
  validates :name, presence: true, length: {maximum: 100}
end
