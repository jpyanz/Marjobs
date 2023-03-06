class Contact < ApplicationRecord
    validates :name, :phone, :message, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Must be a valid email address'}
end