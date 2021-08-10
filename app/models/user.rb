class User < ApplicationRecord
	validates :email,presence: true,
										uniqueness: true,
										format: {with: /\w+@\w+\.{1}[a-zA-Z]{2,}/}
	validates :password_digest,presence: true
	validates :role, inclusion: {in:[0,1,2],message:"role 只能在0，1，2之间"}
	has_secure_password
  
end