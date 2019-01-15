module Entities
  class Scolarship < Grape::Entity
    expose :id
    expose :name
    expose :details
    expose :date
    expose :deadline_date
    expose :deadline_hour
    expose :requeriments
  end
end
