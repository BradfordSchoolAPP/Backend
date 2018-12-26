class Alert
  include Mongoid::Document

  field :title, type: String
  field :details, type: String
  field :date, type: Time
  field :opened, type: Boolean
  field :parent_id, type: Integer

  def self.create_many_with_parents(parents_alert, title, details)
    alerts = []
    parents_alert.each do |p|
      alerts << {
        title: title,
        details: details,
        date: Time.now,
        opened: false,
        parent_id: p
      }
    end
    create(alerts)
  end

  def self.find_with_params(params)
    where(parent_id: params[:parent_id]).limit(10).order_by('date desc')
  end

  def self.open(params)
    alert = find(params[:id]['$oid'].to_s)
    if alert
      alert.opened = true
      alert.update
    end
  end
end
