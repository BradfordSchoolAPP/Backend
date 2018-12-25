module Entities
  class Parent < Grape::Entity
    expose :id
    expose :email
    expose :name
    expose :phone_number
    expose :recv_notifications
    expose :user_types, with: Entities::UserType
  end
end
