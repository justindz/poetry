require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :poems
  has_many :comments
  has_many :favorites
  has_one :avatar
  has_many_friends
  has_many :urls
  
  # Virtual attribute for the unencrypted password
  attr_accessor :password
  attr_accessible :name, :email
 
  validates_presence_of     :name
  validates_presence_of     :password
  validates_presence_of     :password_confirmation
  validates_length_of       :password, :within => 4..40
  validates_confirmation_of :password
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :email, :case_sensitive => false, :allow_blank => true
  before_save :encrypt_password
  
  def has_favorite? (poem_id)
    f = find_favorite(poem_id)
    return true unless f.nil?
  end
  
  def find_favorite (poem_id)
    Favorite.find(:first, :conditions => ["user_id = ? and poem_id = ?", id, poem_id])
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(email, password)
    u = find_by_email(email) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end
 
  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end
 
  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end
 
  def authenticated?(password)
    crypted_password == encrypt(password)
  end
 
  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at
  end
 
  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    self.remember_token_expires_at = 2.weeks.from_now.utc
    self.remember_token            = encrypt("#{name}--#{remember_token_expires_at}")
    save(false)
  end
 
  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end
 
#  protected
    # before filter
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--") if new_record?
      self.crypted_password = encrypt(password)
    end
end
