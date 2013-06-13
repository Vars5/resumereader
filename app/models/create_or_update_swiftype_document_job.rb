class CreateOrUpdateSwiftypeDocumentJob < Struct.new(:job_id)
  def perform
    job = Job.find(:job_id)
    url = Rails.application.routes.url_helpers.job_url(job, :host => "localhost:5000")
    client = Swiftype::Easy.new
    client.create_or_update_document(ENV['SWIFTYPE_ENGINE_SLUG'],
                                        Job.model_name.downcase,
                                         {:external_id => job.id,
                                           :fields => [{:name => 'name', :value => job.name, :type => 'string'},
                                                       {:name => 'info', :value => job.info, :type => 'text'},
                                                       {:name => 'discipline', :value => job.discipline, :type => 'string'}
                                                       ]})
  end   
end                                    