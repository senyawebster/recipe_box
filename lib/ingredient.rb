class Ingredient < ActiveRecord::Base
  belongs_to :recipes
  has_many :tags, through: :recipes
end
