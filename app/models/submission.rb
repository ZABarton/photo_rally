class Submission < ActiveRecord::Base
  belongs_to :objective
  belongs_to :enrollment
end
