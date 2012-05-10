class Comic < ActiveRecord::Base
  attr_accessible :description, :summary, :title, :published_at, :published

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  has_many :frames,	dependent: :destroy

  has_many :categorizations
  has_many :categories, through: :categorizations
end
