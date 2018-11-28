module V1
  class Events < Grape::API
    resource :events do
      desc 'Get all events'
      get do
        present Event.all.limit(20).order_by('date desc'), with: Entities::Event
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
        error! 'Unprocessable Entity', 422 unless new_event = Event.create_with_params(params)
        present new_event, with: Entities::Event
      end

      desc 'Update an event'
      params do
        requires :id, type: JSON, desc: 'Event id'
        requires :title, type: String, desc: 'Event title'
        requires :details, type: String, desc: 'Event details'
        requires :place, type: String, desc: 'Event place'
        requires :date, type: Date, desc: 'Event scheduled date'
        requires :hour, type: String, desc: 'Event scheduled hour'
      end
      put do
        error! 'Unprocessable Entity', 422 unless event = Event.update_with_params(params)
        present event, with: Entities::Event
      end

      desc 'Delete an event'
      params do
        requires :id, type: JSON, desc: 'Event id to delete'
      end
      delete do
        error! 'Unprocessable Entity', 422 unless Event.delete_with_params(params)
        status 200
      end
      route_param :month do
        desc 'Get events of an specific month'
        get do
          present Event.find_by_month(params), with: Entities::Event
        end
      end
    end
  end
end
