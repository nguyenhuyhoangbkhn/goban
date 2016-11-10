class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :hotel
    
    validate :check_content_image
    
    private
    def check_content_image
      if self.content.empty? && self.image.nil?
        errors.add :comment, "Please comment"
      end
    end
end
