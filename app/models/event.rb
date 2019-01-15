class Event
  include Mongoid::Document

  field :title, type: String
  field :details, type: String
  field :place, type: String
  field :date, type: Date
  field :date_month, type: Integer
  field :date_year, type: Integer
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
      new_event.date_month = new_event.date.month
      new_event.date_year = new_event.date.year
      new_event.hour = params[:hour]
      new_event.save
      new_event
    end
  end

  def self.update_with_params(params)
    begin
      event = find(params[:id]['$oid'].to_s)
      event.title = params[:title]
      event.details = params[:details]
      event.place = params[:place]
      event.date = params[:date]
      event.date_month = event.date.month
      event.date_year = event.date.year
      event.hour = params[:hour]
      event.update
      event
    rescue
      []
    end
  end

  def self.delete_with_params(params)
    begin
      event = find(params[:id]['$oid'].to_s)
      event.delete
      event
    rescue
      nil
    end
  end

  def self.current_month
    actual_date = Date.current
    where(date_month: actual_date.month, date_year: actual_date.year)
  end

  def self.find_by_month(params)
    if params.nil?
      p 'Params is null'
    else
      actual_date = Date.current
      where(date_month: params[:month], date_year: actual_date.year)
    end
  end
end
