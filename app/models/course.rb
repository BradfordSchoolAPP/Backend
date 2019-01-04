class Course < ApplicationRecord
	has_many :students
	has_and_belongs_to_many :parents

	def self.students(params)
		begin
			find(params[:id]).students
		rescue
			[]
		end
	end

	def self.years()
	  select(:year_course).map(&:year_course).uniq
	end

	def self.sections(params)
    where(year_course: params[:course]).map(&:section)
	end

	def self.alert(params)
	  if params[:courses].empty?
		  courses = all
	  else
		  courses = where(year_course: params[:courses])
	  end
		tokens = []
		parents_alert = []
	  courses.each do |c|
			c.parents.each do |p|
				if p.devices.any?
        	parents_alert << p.id
					tokens += p.devices.collect(&:token)
				end
			end
    end
    Alert.create_many_with_parents(parents_alert, params[:title], params[:details])
    Exponent::Notification.send_alert(tokens, params[:title], params[:details])
	end

	def self.myStudents(params)
		if params[:section].nil?
			where(year_course: params[:year]).map(&:students)
		else
			where(year_course: params[:year], section: params[:section]).map(&:students)
		end
  end
end
