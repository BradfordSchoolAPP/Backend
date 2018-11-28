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
          requires :email, type: String, desc: 'Parent e-mail'
          requires :password, type: String, desc: 'Parent encrypted password'
        end
        post do
          present Parent.login(params), with: Entities::Parent
        end
      end
    end
  end
end
