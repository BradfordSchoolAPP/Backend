module V1
  class Notifications < Grape::API
    resource :notifications do
      params do
        requires :parent_id, type: Integer
      end
      desc 'Get notifications for a parent'
      route_param :parent_id do
        get do
          present Notification.find_with_tokens(Parent.collect_tokens(params)), with: Entities::Notification
        end
      end
      resource :open do
        params do
          requires :id, type: JSON
        end
        desc 'Set notification opened as true'
        put do
          Notification.open(params)
        end
      end
    end
  end
end
