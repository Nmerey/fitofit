class User < ApplicationRecord
	has_secure_password
	validates_presence_of :email, :password_digest
	validates :email, uniqueness: true
	has_many :activities
end
