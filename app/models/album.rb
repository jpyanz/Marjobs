class Album < ApplicationRecord
    has_one_attached :thumbnail, :dependent => :destroy
    has_many_attached :files, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    validates :title, :files, presence: true
    validates_uniqueness_of :title, :message => "already exists"
    validate :upload_check

    private
    
    def upload_check
        files.each do |file|
            if !file.content_type.in?(%('image/jpeg image/png image/gif video/mp4'))
                errors.add(:files, "needs to be JPEG, PNG, GIF or mp4")
            end
        end
        
        if thumbnail.attached?
            if !thumbnail.content_type.in?(%('image/jpeg image/png image/gif')) 
                errors.add(:thumbnail, "needs to be JPEG, PNG, GIF only")
            end
        end
    end
end
