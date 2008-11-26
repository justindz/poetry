class Poem < ActiveRecord::Base
  acts_as_textiled :body
  acts_as_taggable
  acts_as_ferret :fields => [ :title, :body ], :remote => true
  
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :revisions, :order => 'created_at DESC'
  belongs_to :license
  
  validates_presence_of :body
  
  def Poem.viewed(user, poem)
    unless user == poem.user
      poem.views += 1
      poem.save
    end
  end
  
  def last_revision
    revisions.find(:first, :conditions => [ "revisions.poem_id = ?", id], :order => 'revisions.created_at DESC')
  end
  
  def has_been_revised?
    revisions.empty? ? false : true
  end

  def save_revision
    r = Revision.new
    r.attributes = attributes
    r.poem_id = id
    r.save
  end
end
