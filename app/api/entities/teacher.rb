module Entities
  class Teacher < Grape::Entity
    expose :name
    expose :email
  end
end