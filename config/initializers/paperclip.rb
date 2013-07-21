#Paperclip::Attachment.default_options[:url] = 's3-website-ap-southeast-2.amazonaws.com' 
#Paperclip::Attachment.default_options[:path] = '/:bucket/:class/:attachment/:id_partition/:style/:filename'

Paperclip.interpolates(:s3_sydney_url) { |attachment, style|
  "#{attachment.s3_protocol}://s3-ap-southeast-2.amazonaws.com/#{attachment.resquery-avatars}/#{attachment.path(style).gsub(%r{^/}, "")}"
}