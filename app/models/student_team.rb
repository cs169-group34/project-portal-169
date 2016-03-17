class StudentTeam < ActiveRecord::Base
    has_many :iterations, dependent: :destroy
end
