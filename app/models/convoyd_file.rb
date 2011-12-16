require 'bcrypt'

class ConvoydFile < ActiveRecord::Base
  
  authenticates_with_sorcery!
  
  belongs_to :user
  
  attr_accessible :upload, :user_id, :set_pass, :notification
  attr_accessor :notification, :set_pass
  
  # before_save :encrypt_password
  
  # validates_confirmation_of :password
  
  
  has_attached_file :upload, 
    :storage => :s3,
    :bucket => 'uploads.convoyd.com',
    :s3_credentials => {
      :access_key_id => S3[:key],
      :secret_access_key => S3[:secret]
    },
    :s3_permissions => :private,
    :path => ":attachment/:id/:style/:filename"
  
  validates_attachment_presence :upload
  validates_attachment_size :upload, :less_than => 500.megabytes
  
  STATUSES = %w[locked unlocked]
  
  
  def encrypt_password
    if password.present?
      self.crypted_password = BCrypt::Password.create(password)
    end
  end
  
  
  def password_authentic?(password)
    self.crypted_password == password
    # BCrypt::Password.new(self.crypted_password) == password
  end
    
  
  def requires_password?
    self.crypted_password.present?
  end
  
  
  def authenticated?(file_id)
    file_id == self.id
  end
  
  
  def set_random_password
    self.crypted_password = ConvoydFile.random_password(10)
    self.save
  end
  
    
  protected

  def self.random_password(length)
    rand(36**length).to_s(36)
  end
  
end
