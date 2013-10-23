class Question < ActiveRecord::Base
  attr_accessible :question_content, :user_id, :company_id, :category_id
  
  has_many :questioncomment
  has_many :comments, through: :questioncomment


  def load_company
    Company.find(self.company_id)
  end
  
  def company_name
    self.load_company.name
  end

  def company_logo
    
  end

end

