module V1
  class Alerts < Grape::API
    resource :alerts do
      params do
        requires :parent_id, type: Integer
      end
      desc 'Get alerts for a parent'
      route_param :parent_id do
        get do
          present Alert.find_with_params(params), with: Entities::Alert
        end
      end
      resource :open do
        params do
          requires :id, type: JSON
        end
        desc 'Set alert opened as true'
        put do
          Alert.open(params)
          status 200
        end
      end
    end
  end
end
