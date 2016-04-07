class Team < ActiveRecord::Base
  # Remember to create a migration!
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :leader, class_name: "User"
  has_many :enrollments
end

