class New
  include Mongoid::Document

  field :title, type: String
  field :details, type: String
  field :img_dir, type: String
  field :img_num, type: Integer
  field :date, type: Time
  field :important, type: Boolean

  def self.create_with_params(params)
    if params.nil?
      p 'Params is null'
    else
      anew = new
      anew.title = params[:title]
      anew.details = params[:details]
      anew.img_dir = params[:img_dir]
      anew.img_num = params[:img_num]
      anew.important = params[:important]
      anew.date = Time.now
      anew
    end
  end

  def self.all_ordered
    all.limit(10).order_by('date desc')
  end

  def self.important
    where(important: true).limit(10).order_by('date desc')
  end

  def notificate
    tokens = Device.all.collect(&:token)
    Exponent::Notification.send_new(tokens, title, details, date, img_dir)
  end
end
