class Client < ActiveRecord::Base

	has_many :sells

	#validates :name, :email, :password, presence: true 
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true
	
	#for carrierwave
	mount_uploader :avatar, AvatarUploader

	after_create :send_email
	
	def login
		Client.where(email: self.email, password: self.password).first
	end

	def send_email
		RegisterMailer.register(self).deliver_now #deliver_now
		#SendEmailJob.set(wait: 30.seconds).perform_later(self)
	end

	def self.newsletter
		Client.all.each do |client|
			client.send_email
		end
  	end

  	def self.create_with_omniauth(auth)
		self.create! do |client|
			client.provider=auth['provider']
			client.uid=auth['uid']
			client.name=auth['info']['name']
			client.token=auth['credentials']['token']
			client.secret=auth['credentials']['secret']
			client.url_photo=auth['info']['image']
		end
  	end
end
