module API
  class API < Grape::API
    format :json
    prefix :api

    version 'v1', using: :path do
      mount ::V1::News
      mount ::V1::Events
      mount ::V1::Parents
      mount ::V1::Notifications
    end
  end
end
