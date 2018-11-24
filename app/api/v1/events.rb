module V1
  class Events < Grape::API
    resource :events do
      desc 'Get last 10 events'
      get do
        present Event.all.limit(10).order_by('date desc'), with: Entities::Event
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
        new_event
      end

      desc 'Delete an event'
      params do
        requires :id, type: String, desc: 'Event id to delete'
      end
      delete do
        error! 'Unprocessable Entity', 422 unless Event.delete_with_params params
        status 200
      end
    end
  end
end
