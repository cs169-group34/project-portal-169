class Instructor < ActiveRecord::Base
    has_many :student_teams, dependent: :destroy
end
