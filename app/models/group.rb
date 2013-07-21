class Group < ActiveRecord::Base
  attr_accessible :name, :private, :groupmembers_attributes, :commentable, :body, :user_id, :description

  #comments
  acts_as_commentable

  #social _feature_
  has_many :groupmembers
  has_many :users, through: :groupmembers
  accepts_nested_attributes_for :groupmembers

  has_many :documents
  
  #validations
  validates :name, length: { maximum: 50 }

  has_attached_file :grouplogos,
      :storage => :s3,
      :bucket => 'resquery-group-logos',
      :url => ":s3_domain_url",
      :path => "/:class/grouplogos/:id_:basename.:style.:extension",
      :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }

end
