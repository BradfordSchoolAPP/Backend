module Entities
  class Parent < Grape::Entity
    expose :username
    expose :name
    expose :email
    expose :phone_number
    expose :user_types, with: Entities::UserType
  end
end