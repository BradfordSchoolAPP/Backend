class Student < ApplicationRecord
	belongs_to :course
	has_and_belongs_to_many :parents

	def self.myParents(params)
    find(params[:id]).parents
	end

	def self.CourseList(params)
		{"id_course": where(id: params[:id]).map(&:course)[0].id,
		"myCompaneros": where(["id != ?, course_id=?", params[:id], 7])
		}
	end
end
