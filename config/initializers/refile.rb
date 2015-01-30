# config/initializers/refile.rb
require "refile/backend/s3"

aws = {
  access_key_id: ENV['AWS_ACCESS_ID'],
  secret_access_key: ENV['AWS_SECRET_KEY'],
  bucket: ENV['AWS_BUCKET']#,
  # region: ENV['AWS_REGION'],
  # url: "https://#{ENV['AWS_BUCKET']}.s3.amazonaws.com"
}
Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)