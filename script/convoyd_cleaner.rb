# Clean out ConvoydFiles that were created over 48 hours ago

ENV["RAILS_ENV"] ||= "production"

require 'aws/s3'
require "#{ENV['RAILS_ROOT']}/config/environment"

include AWS::S3


Base.establish_connection!(
  :access_key_id => S3[:key],
  :secret_access_key => S3[:secret]
)

bucket = Bucket.find("uploads.convoyd.com")

# To get modified time for a bucket object
# Time.parse(convoyd_bucket.objects[0].about["last-modified"]) => 2011-12-08 22:59:33 -0500

bucket.objects.each do |object|
  modified_time = Time.parse(object.about["last-modified"])
  object.delete if (modified_time + (48 * 60 * 60)) < Time.now
end
