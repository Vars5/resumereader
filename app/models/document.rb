class Document < ActiveRecord::Base
  attr_accessible :description, :group_id, :name, :user_id, :document
  
  has_attached_file :document,
      :storage => :s3,
      :bucket => 'resquery-group-documents',
      :url => ":s3_domain_url",
      :path => "/:class/avatars/:id_:basename.:style.:extension",
      :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
end
