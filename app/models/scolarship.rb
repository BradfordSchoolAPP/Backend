class Scolarship
  include Mongoid::Document

  field :name, type: String
  field :details, type: String
  field :date, type: Date
  field :deadline_date, type: Date
  field :deadline_hour, type: String
  field :requeriments, type: Array

  def self.create_with_params(params)
    if params.nil?
      p 'Params is null'
    else
      ss = new
      ss.title = params[:title]
      ss.details = params[:details]
      ss.date = Time.now
      ss.deadline_date = params[:deadline_date]
      ss.deadline_hour = params[:deadline_hour]
      ss.requeriments = params[:requeriments]
      ss
    end
  end

  def self.update_with_params(params)
    if params.nil?
      p 'Params is null'
    else
      ss = find(params[:id]['$oid'].to_s)
      if ss
        ss.title = params[:title]
        ss.details = params[:details]
        ss.date = params[:date]
        ss.deadline_date = params[:deadline_date]
        ss.deadline_hour = params[:deadline_hour]
        ss.requeriments = params[:requeriments]
        ss.update
        ss
      end
    end
  end

  def self.delete_with_params(params)
    if params.nil?
      p 'Params is null'
    else
      ss = find(params[:id]['$oid'].to_s)
      if ss
        ss.delete
        ss
      end
    end
  end
end
