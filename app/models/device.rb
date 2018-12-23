class Device < ApplicationRecord
	has_and_belongs_to_many :parents
	
	def self.notification_news(new)
		tokens = all.collect(&:token)
		Exponent::Notification.send_new(tokens, new.title, new.details, new.date, new.img_dir)
	end
end
