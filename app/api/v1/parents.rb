module V1
  class Parents < Grape::API
    resource :parents do
      desc 'Get all parents'
      get do
        present Parent.all.limit(10), with: Entities::Parent
      end

      desc 'Login endpoint'
      resource :login do
        params do
          requires :username, type: String, desc: 'Parent username'
          requires :password, type: String, desc: 'Parent encrypted password'
        end
        post do
          present Parent.find_with_params(params), with: Entities::Parent
        end
      end
    end
  end
end
