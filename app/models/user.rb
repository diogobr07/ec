class User < ActiveRecord::Base
	validates_presence_of :name, :email
	validates_uniqueness_of :email
	has_secure_password
	has_many :posts

	def self.authenticate(email, password)
		user = find_by(email: email)

		if user.present?
			user.authenticate(password)
		end
		
	end
end	
