class New
  include Mongoid::Document

  field :title, type: String
  field :details, type: String
  field :img_url, type: String
  field :important, type: Boolean

  def create(title, details, img_url, important)
    self.title = title
    self.details = details
    self.img_url = img_url
    self.important = important
    save
  end
end
