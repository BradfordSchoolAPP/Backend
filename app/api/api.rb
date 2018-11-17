module API
  class API < Grape::API
    format :json
    prefix :api

    version 'v1', using: :path do
      mount ::V1::News
    end
  end
end