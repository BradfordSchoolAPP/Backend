module V1
  class Courses < Grape::API
    resource :courses do
      desc 'Get all courses with sections'
      get do
        present Course.all, with: Entities::Course
      end
      resource :years do
        desc 'Get all years of courses'
        get do
          present Course.years
        end
      end
      resource :sections do
        desc 'Get sections from a specific course'
        params do
          requires :course, type: String, desc: 'Course to get sections'
        end
        get do
          present Course.sections(params)
        end
      end
      params do 
        requires :id, type: Integer, desc: 'Course id'
      end
      route_param :id do
        resource :students do
          desc 'Get student for specific course'
          get do
            present Course.students(params), with: Entities::Student
          end
        end
      end
    end
  end
end
