module Entities
  class Alert < Grape::Entity
    expose :id
    expose :title
    expose :details
    expose :date
    expose :opened
  end
end
