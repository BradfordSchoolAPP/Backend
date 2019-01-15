class Scolarship
  include Mongoid::Document

  field :name, type: String
  field :details, type: String
  field :date, type: Date
  field :deadline_date, type: Date
  field :deadline_hour, type: String
  field :requeriments, type: Array

  def self.create_with_params(params)
    begin
      ss = new
      ss.name = params[:name]
      ss.details = params[:details]
      ss.date = Time.now
      ss.deadline_date = params[:deadline_date]
      ss.deadline_hour = params[:deadline_hour]
      ss.requeriments = params[:requeriments]
      ss
    rescue
      []
    end
  end

  def self.update_with_params(params)
    begin
      ss = find(params[:id]['$oid'].to_s)
      ss.name = params[:name]
      ss.details = params[:details]
      ss.date = params[:date]
      ss.deadline_date = params[:deadline_date]
      ss.deadline_hour = params[:deadline_hour]
      ss.requeriments = params[:requeriments]
      ss.update
      ss
    rescue
      []
    end
  end

  def self.delete_with_params(params)
    begin
      ss = find(params[:id]['$oid'].to_s)
      ss.delete
      ss
    rescue
      nil
    end
  end
end
