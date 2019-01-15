module V1
  class Informations < Grape::API
    resource :informations do
      desc 'Get information' 
      get do
        present Information.last, with: Entities::Information
      end
    end
  end
end
