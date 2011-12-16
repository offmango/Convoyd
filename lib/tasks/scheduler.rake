require 'aws/s3'

include AWS::S3

desc "Remove all files on S3 that are over 48 hours old"
task :delete_expired_files => :environment do

  Base.establish_connection!(
    :access_key_id => S3[:key],
    :secret_access_key => S3[:secret]
  )
  bucket = Bucket.find("uploads.convoyd.com")
  bucket.objects.each do |object|
    modified_time = Time.parse(object.about["last-modified"])
    object.delete if (modified_time + (48 * 60 * 60)) < Time.now
  end
  
end