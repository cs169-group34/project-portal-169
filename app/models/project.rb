class Project < ActiveRecord::Base
    belongs_to :student_team
    belongs_to :customer
end
