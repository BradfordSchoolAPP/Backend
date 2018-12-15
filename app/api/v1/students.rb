module V1
	class Students < Grape::API
		resource :students do
      params do 
        requires :id, type: Integer, desc: 'Student id'
      end
      route_param :id do
        resource :myparents do
          desc 'Get parents of a specific student'
          get do
            present Student.myParents(params)
          end
        end
      end
    end
	end  
end