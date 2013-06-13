task :index_jobs => :environment do
  if ENV['SWIFTYPE_API_KEY'].blank?
    abort("SWIFTYPE_API_KEY not set")
  end

  if ENV['SWIFTYPE_ENGINE_SLUG'].blank?
    abort("SWIFTYPE_ENGINE_SLUG not set")
  end

  client = Swiftype::Easy.new

  Job.find_in_batches(:batch_size => 100) do |jobs|
    documents = jobs.map do |job|
      url = Rails.application.routes.url_helpers.job_url(job)
      {:external_id => job.id,
       :fields => [ {:name => 'name', :value => job.name, :type => 'string'},
                     {:name => 'discipline', :value => job.discipline, :type => 'string'},
                     {:name => 'info', :value => job.info, :type => 'text'},
                     {:name => 'link', :value => link, :type => 'enum'}}]}
    end

    results = client.create_or_update_documents(ENV['SWIFTYPE_ENGINE_SLUG'], Job.model_name.downcase, documents)

    results.each_with_index do |result, index|
      puts "Could not create #{jobs[index].name} (##{jobs[index].id})" if result == false
    end
  end
end