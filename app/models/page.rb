class Page < ActiveRecord::Base
  belongs_to :chapbook
  belongs_to :poem
  
  validates_presence_of :sequence
  validates_uniqueness_of :sequence
  validates_uniqueness_of :poem_id, :scope => :chapbook_id
end
