class Booking < ApplicationRecord
    serialize :addons
    validates :package, :date, :name, :phone, :email, :venue, presence: true
end
