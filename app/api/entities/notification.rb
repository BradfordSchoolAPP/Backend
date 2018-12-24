module Entities
  class Notification < Grape::Entity
    expose :title
    expose :details
    expose :date
    expose :opened
    expose :type
  end
end
