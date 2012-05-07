class Comic < ActiveRecord::Base
  attr_accessible :description, :summary, :title
end
