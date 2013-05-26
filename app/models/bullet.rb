class Bullet < ActiveRecord::Base
   attr_accessible :bulletpoint
  
   belongs_to :bulletable, polymorphic: true  
end
