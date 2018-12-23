module Entities
  class Student < Grape::Entity
    expose :name
    expose :course_id
    expose :created_at
  end
end