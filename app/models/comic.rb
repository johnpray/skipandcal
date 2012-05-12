class Comic < ActiveRecord::Base
  attr_accessible :description, :summary, :title, :published_at, :published, :category_ids

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  has_many :frames,	dependent: :destroy

  has_many :categorizations
  has_many :categories, through: :categorizations

  default_scope order: 'published_at DESC'
  self.per_page = 4

  validates :published_at,	presence: true

  def self.random
  	if (c = Comic.count) != 0
      Comic.where(published: true).find(:first, :offset =>rand(c))
    end
  end

  def next(category = nil)
    if !category.nil?
      category.comics.where("published_at > ?", published_at).last
    else
      Comic.where("published_at > ?", published_at).last
    end
  end

  def previous(category = nil)
    if !category.nil?
      category.comics.where("published_at < ?", published_at).first
    else
      Comic.where("published_at < ?", published_at).first
    end
  end
end
