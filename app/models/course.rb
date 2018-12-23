class Course < ApplicationRecord
	has_many :students
	has_and_belongs_to_many :parents

	def self.students(params)
		find(params[:id]).students
	end

	def self.years()
		select(:year_course).map(&:year_course).uniq
	end

	def self.sections(params)
    where(year_course: params[:course]).map(&:section)
	end

	def self.myStudents(params)
		if params[:section].nil?
			where(year_course: params[:year]).map(&:students)
		else
			where(year_course: params[:year], section: params[:section]).map(&:students)
		end
  end
end
