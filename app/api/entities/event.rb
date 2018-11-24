module Entities
  class Event < Grape::Entity
    expose :id
    expose :title
    expose :details
    expose :place
    expose :scheduled_date
    expose :date
    expose :archived
  end
end
