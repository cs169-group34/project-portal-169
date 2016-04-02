class StudentTeam < ActiveRecord::Base
    has_many :iterations, dependent: :destroy
    belongs_to :instructor
    has_one :project
end
