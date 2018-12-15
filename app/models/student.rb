class Student < ApplicationRecord
	belongs_to :course
	has_and_belongs_to_many :parents

	def self.myParents(params)
    	where(id: params[:id]).map(&:parents)
	end
end
