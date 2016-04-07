class Objective < ActiveRecord::Base
  belongs_to :list
  has_many :submissions
end
