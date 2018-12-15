module Entities
  class Student < Grape::Entity
    expose :name
    expose :course, with: Entities::Course
  end
end