class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :comic_id

  belongs_to :category
  belongs_to :comic
end
