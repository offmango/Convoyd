class ConvoydFile < ActiveRecord::Base
  
  authenticates_with_sorcery!
  
  belongs_to :user
  
  attr_accessible :upload, :user_id, :password, :password_confirmation, :notification
  attr_accessor :notification, :password, :password_confirmation
  
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
    
  
  def requires_password?
    self.crypted_password.present?
  end
  
  
  def authenticated?
    session[:file_id] && session[:file_id] == self.id
  end
  
  
end
