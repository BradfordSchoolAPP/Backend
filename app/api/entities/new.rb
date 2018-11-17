module Entities
  class New < Grape::Entity
    expose :title
    expose :details
    expose :img_url
    expose :date
    expose :important
  end
end