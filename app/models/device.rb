class Device < ApplicationRecord
	has_and_belongs_to_many :parents
	
	def self.notification_all(params)
		tokens = all.collect(&:token)
		Exponent::Notification.send(tokens, 'Nueva Noticia!', params[:title])
	end
end
