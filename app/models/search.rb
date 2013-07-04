class Search < ActiveRecord::Base
  attr_accessible :category_id, :location, :role_id

  def jobs
    @jobs ||= find_jobs
  end
  
  private
  
  def find_jobs
    jobs = Job.order(:due_date)
    jobs = jobs.where(category_id: category_id) if category_id.present?
    jobs = jobs.where(role_id: role_id) if role_id.present?
    jobs
  end 


end
