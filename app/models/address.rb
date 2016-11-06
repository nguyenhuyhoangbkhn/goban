class Address < ActiveRecord::Base
  belongs_to :distric
  belongs_to :village
  belongs_to :provincial
  has_many :hotels, dependent: :destroy
  
  validates :building_name, presence: true, length: {maximum: 100}
  validate :check_address
  
  private
  def check_address
    if !self.village.nil? && !self.distric.nil? && self.village.distric != self.distric
      errors.add :address, "Distric of village not equal select distric"
    end
    if !self.distric.nil? && !self.provincial.nil? && self.distric.provincial != self.provincial
      errors.add :address, "Provincial of distric not equal select provincial"
    end
    if !self.village.nil? && !self.provincial.nil? && self.village.distric.provincial != self.provincial
      errors.add :address, "Provincial of village not equal select provincial"
    end
    if self.village.nil? && self.distric.nil? && self.provincial.nil?
      errors.add :address, "Not nil"
    end
    if !self.village.nil? && self.distric.nil?
      self.distric = self.village.distric
    end
    if !self.village.nil? && self.provincial.nil?
      self.provincial = self.village.distric.provincial
    end
    if !self.distric.nil? && self.provincial.nil?
      self.provincial = self.distric.provincial
    end
  end
end
