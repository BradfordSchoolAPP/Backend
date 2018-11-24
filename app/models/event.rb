class Event
  include Mongoid::Document

  field :title, type: String
  field :details, type: String
  field :place, type: String
  field :scheduled_date, type: Time
  field :date, type: Time
  field :archived, type: Boolean

  def self.create_with_params(params)
    if params.nil?
      p 'Params is null'
    else
      new_event = new
      new_event.title = params[:title]
      new_event.details = params[:details]
      new_event.place = params[:place]
      new_event.scheduled_date = params[:scheduled_date]
      new_event.archived = false
      new_event.date = Time.now
      new_event
    end
  end

  def self.delete_with_params(params)
    if params.nil?
      p 'Params is null'
    else
      event = find(params[:event_id])
      if event
        event.archived = true
        event
      end
    end
  end
end
