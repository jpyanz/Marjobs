class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :username, presence: true
    validates :password, presence: true, length: { minimum: 5 }
end
