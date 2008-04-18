class Chapbook < ActiveRecord::Base
  acts_as_taggable
  acts_as_textiled :introduction
  acts_as_ferret :fields => [ :title, :introduction ]
  
  belongs_to :user
  has_many :pages
  has_many :poems, :through => :pages
  has_one :cover
  
  validates_presence_of :title
end
