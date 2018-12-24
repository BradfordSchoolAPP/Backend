class Notification
  include Mongoid::Document

  field :title, type: String
  field :details, type: String
  field :date, type: Time
  field :opened, type: Boolean
  field :type, type: String # can be 'noticia' or 'alerta'
  field :object_id, type: String
  field :token, type: String

  def self.create_with_tokens(tokens, title, details, notif_type, object_id)
    tokens.each do |t|
      notification = new
      notification.title = title
      notification.details = details
      notification.date = Time.now
      notification.opened = false
      notification.type = notif_type
      notification.object_id = object_id
      notification.token = t
      notification.save
    end
  end

  def self.find_with_tokens(tokens)
    where(token: tokens)
  end

  def self.open(params)
    notif = find(params[:id]['$oid'].to_s)
    if notif
      notif.opened = true
      notif.update
    end
  end
end
