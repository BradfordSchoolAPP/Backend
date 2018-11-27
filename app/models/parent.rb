class Parent < ApplicationRecord
	has_many :parents_logs

	has_and_belongs_to_many :user_types
	has_and_belongs_to_many :students
	has_and_belongs_to_many :courses
	has_and_belongs_to_many :devices

	def self.login(params)
		if params.nil?
      p 'Params is null'
    else
			begin
				parent = where(username: params[:username], password: params[:password])
			rescue
				parent = []
			end
			parent
		end
	end
end
