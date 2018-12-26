module Entities
  class Student < Grape::Entity
    expose :id
    expose :name
    expose :course, with: Entities::Course
  end
end