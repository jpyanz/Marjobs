class Category < ApplicationRecord
    validates_uniqueness_of :category, :message => "already exists"
end
