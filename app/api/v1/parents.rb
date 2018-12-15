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
      desc 'Get students from a specific parent'
      params do 
        requires :id, type: Integer, desc: 'Parent id'
      end
      route_param :id do
        resource :students do
          get do
            present Parent.students(params)
          end
        end
      end
    end
  end
end
