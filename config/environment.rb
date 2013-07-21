# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Resumereader::Application.initialize!

AWS::S3::DEFAULT_HOST = "s3-ap-southeast-2.amazonaws.com"
