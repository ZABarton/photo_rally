class Article < ActiveRecord::Base
  validates_presence_of :name, :description, :price
  validates :name, length: { minimum: 2 }
  belongs_to :category
end
