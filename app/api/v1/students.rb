module V1
	class Students < Grape::API
		resource :students do
      resource :myparents do
        desc 'Get parents of a specific student'
        params do 
          requires :id, type: Integer, desc: 'Student id'
        end
        get do
          present Student.myParents(params)
        end
        
      end
    end
	end  
end