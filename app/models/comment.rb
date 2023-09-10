class Comment < ApplicationRecord
  belongs_to :album
  validates :name, :body, presence: true 
end
