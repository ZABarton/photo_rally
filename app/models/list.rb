class List < ActiveRecord::Base
  has_many :events
  has_many :objectives
end
