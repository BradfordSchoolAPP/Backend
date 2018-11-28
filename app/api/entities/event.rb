module Entities
  class Event < Grape::Entity
    expose :id
    expose :title
    expose :details
    expose :place
    expose :date
    expose :hour
  end
end
