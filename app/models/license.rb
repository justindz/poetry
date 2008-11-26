class License < ActiveRecord::Base
  has_many :poems
  
  validates_presence_of :name
  validates_presence_of :embed
end
