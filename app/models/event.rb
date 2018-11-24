class Event
  include Mongoid::Document

  field :title, type: String
  field :details, type: String
  field :place, type: String
  field :date, type: Date
  field :hour, type: String

  def self.create_with_params(params)
    if params.nil?
      p 'Params is null'
    else
      new_event = new
      new_event.title = params[:title]
      new_event.details = params[:details]
      new_event.place = params[:place]
      new_event.date = params[:date]
      new_event.hour = params[:hour]
      new_event
    end
  end

  def self.delete_with_params(params)
    if params.nil?
      p 'Params is null'
    else
      event = find(params[:id])
      if event
        event.delete
        event
      end
    end
  end
end
