class Chapbook < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to :user
  has_and_belongs_to_many :poems
  
  validates_presence_of :title
end
