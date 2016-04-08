class Event < ActiveRecord::Base
  has_many :enrollments
  has_many :teams, through: :enrollments
  belongs_to :list
end
