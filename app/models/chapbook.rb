class Chapbook < ActiveRecord::Base
  belongs_to :user
  has_many :poems
  
  validates_presence_of :title
end
