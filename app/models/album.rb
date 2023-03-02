class Album < ApplicationRecord
    has_one_attached :thumbnail, :dependent => :destroy
    has_many_attached :images, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    validates :name, :images, presence: true
    validate :upload_check

    private
    
    def upload_check
        images.each do |img|
            if !img.content_type.in?(%('image/jpeg image/png image/gif video/mp4'))
                errors.add(:images, "needs to be JPEG, PNG, GIF or mp4")
            end
        end
        
        if thumbnail.attached?
            if !thumbnail.content_type.in?(%('image/jpeg image/png image/gif')) 
                errors.add(:thumbnail, "needs to be JPEG, PNG, GIF only")
            end
        end
    end
end
