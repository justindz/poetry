class Url < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :url
  
  validates_uniqueness_of :url
end
