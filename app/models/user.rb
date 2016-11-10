class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :remember_token
  
  before_save {self.email = email.downcase}
  
  mount_uploader :picture, PictureUploader
  ratyrate_rater
  
  validates :name, presence: true, length: {maximum: 50}
  validate :picture_size
  validates :state, presence: true, length: {maximum: 50}
  validates :phone, length: {minimum: 10, maximum: 11}

  has_many :comments, dependent: :destroy
  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, t(:picture_size)
    end
  end
end
