module Entities
  class Parent < Grape::Entity
    expose :id
    expose :email
    expose :name
    expose :phone_number
    expose :recv_notifications
    expose :active_user
    expose :user_types, with: Entities::UserType
  end
end
