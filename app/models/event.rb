class Event < ActiveRecord::Base
  has_many :enrollments
  belongs_to :list
end
