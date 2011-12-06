class ConvoydFile < ActiveRecord::Base
  
  authenticates_with_sorcery!
  
  has_attached_file :upload, 
    :storage => :s3,
    :bucket => 'uploads.convoyd.com',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    }
  
  validates_attachment_presence :upload
  validates_attachment_size :upload, :less_than => 500.megabytes
  
  
end
