class DeleteSwiftypeDocumentJob < Struct.new(:job_id)
  def perform
    client = Swiftype::Easy.new
    client.destroy_document(ENV['SWIFTYPE_ENGINE_SLUG'], Job.model_name.downcase, job_id)
  end
end