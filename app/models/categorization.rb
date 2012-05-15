class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :comic

  has_paper_trail
end
