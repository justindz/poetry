class Cover < ActiveRecord::Base
  belongs_to :chapbook
  
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 2.megabytes
                
  validates_as_attachment
end
