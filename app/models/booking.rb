class Booking < ApplicationRecord
    serialize :addons
    validates :package, :date, :name, :phone, :venue, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Must be a valid email address'}
end
