class User < ApplicationRecord
    has_secure_password

    validates :name, :username, presence: true
    validates :password, length: { minimum: 5 }
    validates_uniqueness_of :username, :message => "already exists"
end
