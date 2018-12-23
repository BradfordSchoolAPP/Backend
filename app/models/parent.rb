class Parent < ApplicationRecord
	has_many :parents_logs

	has_and_belongs_to_many :user_types
	has_and_belongs_to_many :students
	has_and_belongs_to_many :courses
	has_and_belongs_to_many :devices

	def self.find_with_params(params)
		find(params[:id])
	end

	def self.login(params)
		begin
			parent = where(email: params[:email], password: params[:password])
		rescue
			parent = []
		end
		parent
	end

	def add_device(params)
		dev = Device.create(token: params[:token])
		devices << dev
		save
	end

	def self.students(params)
    find(params[:id]).students
	end
end
