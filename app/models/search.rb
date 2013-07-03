class Search < ActiveRecord::Base
  attr_accessible :discipline, :location, :role

  def jobs
    @jobs ||= find_jobs
  end
  
  
  
  
  private
  
  def find_jobs
    jobs = Job.order(:due_date)
    jobs = jobs.where(discipline: discipline) if discipline.present?
    jobs = jobs.where(role: role) if role.present?
    jobs
  end 


end
