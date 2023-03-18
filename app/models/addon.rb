class Addon < ApplicationRecord
    validates :name, :price, presence: true
    validates_uniqueness_of :name, :message => "already exists"
end
