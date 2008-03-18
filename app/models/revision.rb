class Revision < ActiveRecord::Base
  belongs_to :poem
  acts_as_textiled :body
  
  validates_presence_of :body
  attr_accessible :title, :body
end
