class Provincial < ActiveRecord::Base
  has_many :districs, dependent: :destroy
  has_many :addresses, dependent: :destroy
  
  validates :name, presence: true, length: {maximum: 100}
  enum kind: [:provincial, :city]
end
