class Album < ApplicationRecord
    has_many_attached :images
    has_many :comments
    validates :name, presence: true
    validate :upload_check

    private
    
    def upload_check
        if images.attached? == false
            errors.add(:images, "are missing!")
        end

        images.each do |img|
            if !img.content_type.in?(%('image/jpeg image/png'))
                errors.add(:images, "needs to be JPEG or PNG")
            end
        end
    end
end
