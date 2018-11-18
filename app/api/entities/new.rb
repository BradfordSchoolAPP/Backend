module Entities
  class New < Grape::Entity
    expose :title
    expose :details
    expose :img_dir
    expose :img_num
    expose :date
    expose :important
  end
end