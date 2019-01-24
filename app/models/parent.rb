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
		begin
			find(params[:id]).students
		rescue
			[]
		end
	end

	def self.collect_tokens(params)
		find(params[:id]).devices.collect(&:token)
	end

	def self.validateRegister(params)
		parent = find_by_id(params[:id])
		if parent.nil?
			{info: "correo no existe en la base de datos, favor de contactarse al correo del centro de padres"}
		else
			if parent.active_user == true
				{info: "correo ya tiene contraseña asignada."}
			else
				pass = Passgen::generate(:digits => :only, :length => 5)
				parent.update({
					password: pass,
					active_user: true})
				RegistrationMailMailer.new_register(parent,pass).deliver_now 
				{info: "contraseña enviada al correo"}
			end
		end

	end

end
