class Category < ActiveRecord::Base
  attr_accessible :description, :name, :summary

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :categorizations
  has_many :comics, through: :categorizations

  has_paper_trail

  default_scope order: 'name ASC'
end
