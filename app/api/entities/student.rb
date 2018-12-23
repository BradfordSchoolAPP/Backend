module Entities
  class Student < Grape::Entity
    expose :name
    expose :course_id
  end
end