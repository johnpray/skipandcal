class Comic < ActiveRecord::Base
  attr_accessible :description, :summary, :title, :published_at, :published, :category_ids

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  has_many :frames,	dependent: :destroy

  has_many :categorizations
  has_many :categories, through: :categorizations

  default_scope order: 'published_at DESC'
  self.per_page = 3

  validates :published_at,	presence: true

  def self.random
  	if (c = Comic.count) != 0
      Comic.where(published: true).find(:first, :offset =>rand(c))
    end
  end
end
