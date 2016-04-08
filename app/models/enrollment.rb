class Enrollment < ActiveRecord::Base
  belongs_to :team
  belongs_to :event
  has_many :submissions
end

