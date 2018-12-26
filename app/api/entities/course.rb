module Entities
  class Course < Grape::Entity
    expose :id
    expose :year_course
    expose :section
  end
end
