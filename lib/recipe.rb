class Recipe < ActiveRecord::Base
  belongs_to :tag
  has_many :ingredients
end
