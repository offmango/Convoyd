class ConvoydFile < ActiveRecord::Base
  
  authenticates_with_sorcery!
  
  belongs_to :user
  
  has_attached_file :upload, 
    :storage => :s3,
    :bucket => 'uploads.convoyd.com',
    :s3_credentials => {
      :access_key_id => S3[:key],
      :secret_access_key => S3[:secret]
    }
  
  validates_attachment_presence :upload
  validates_attachment_size :upload, :less_than => 500.megabytes
  
  STATUSES = %w[locked unlocked]
    
  
  
end
