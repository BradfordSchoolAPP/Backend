module Entities
  class Course < Grape::Entity
    expose :year_course
    expose :section
  end
end
