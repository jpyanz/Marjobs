class Album < ApplicationRecord
    has_many_attached :images do |attachable|
        attachable.variant :thumb, resize_to_limit: [300, 300]
    end
    validates :name, presence: true
    validate :image_type

    private
        def image_type
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
