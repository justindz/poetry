class Chapbook < ActiveRecord::Base
  acts_as_taggable
  acts_as_textiled :introduction
  acts_as_ferret :fields => [ :title, :introduction ]
  
  belongs_to :user
  has_and_belongs_to_many :poems
  
  validates_presence_of :title
end
