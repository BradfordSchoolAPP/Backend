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
      resource :alert do
        desc 'Send a notifications to course parents'
        params do
          requires :courses, type: Array, desc: 'List of courses to send the alert'
          requires :title, type: String, desc: 'Title of the alert'
          requires :details, type: String, desc: 'Details of the alert'
        end
        post do
          Course.alert(params)
          status 200
        end
      end
    end
  end
end
