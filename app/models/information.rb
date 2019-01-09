class Information
  include Mongoid::Document

  field :description, type: String
  field :address, type: String
  field :people, type: Array
  field :phone_numbers, type: Array
  field :email, type: String

  def self.email
    last.email
  end
end
