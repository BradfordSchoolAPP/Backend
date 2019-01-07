module Entities
  class Course < Grape::Entity
    expose :id
    expose :year_course
    expose :section
    expose :teachers, with: Entities::Teacher 
  end
end
