class Iteration < ActiveRecord::Base
  
  belongs_to :student_team
    
  def iteration_string
    "Iteration #{(self.iteration + 1) / 2}-#{(self.iteration - 1) % 2 + 1}" 
  end

  def created_at_string
    self.created_at.strftime("%m/%d/%Y - %I:%M%p")
  end

end
