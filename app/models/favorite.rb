class Favorite < ActiveRecord::Base
  belongs_to :poem
  belongs_to :user
  
  validates_uniqueness_of :poem_id, :scope => :user_id
end
