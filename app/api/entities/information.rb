module Entities
  class Information < Grape::Entity
    expose :id
    expose :description
    expose :address
    expose :people
    expose :phone_numbers
    expose :email
  end
end
