module V1
  class Events < Grape::API
    resource :events do
      desc 'Get events of the current month and year'
      get do
        actual_date = Date.current
        present Event.where(date_month: actual_date.month, date_year: actual_date.year), with: Entities::Event
      end

      desc 'Create an event'
      params do
        requires :title, type: String, desc: 'Event title'
        requires :details, type: String, desc: 'Event details'
        requires :place, type: String, desc: 'Event place'
        requires :date, type: Date, desc: 'Event scheduled date'
        requires :hour, type: String, desc: 'Event scheduled hour'
      end
      post do
        new_event = Event.create_with_params params
        error! 'Unprocessable Entity', 422 unless new_event.save
        present new_event, with: Entities::Event
      end

      desc 'Delete an event'
      params do
        requires :id, type: String, desc: 'Event id to delete'
      end
      delete do
        error! 'Unprocessable Entity', 422 unless Event.delete_with_params params
        status 200
      end
      route_param :month do
        desc 'Get events of an specific month'
        get do
          actual_date = Date.current
          present Event.where(date_month: params[:month], date_year: actual_date.year), with: Entities::Event
        end
      end
    end
  end
end
