class Avatar < ActiveRecord::Base
  belongs_to :user
  
  has_attachment :content_type => :image, 
                 :storage => defined?(HerokuApp) ? 'heroku' : 'file_system',
                 :max_size => 500.kilobytes,
                 :resize_to => '48x48>'

  validates_as_attachment
end
