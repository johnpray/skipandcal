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

  def self.random(category = nil)
  	if category
      category.comics.where(published: true).find(:first, :offset =>rand(category.comics.count))
    else
      Comic.where(published: true).find(:first, :offset =>rand(Comic.count))
    end
  end

  def self.oldest(category = nil)
    if category
      category.comics.where(published: true).last
    else
      Comic.where(published: true).last
    end
  end

  def self.newest(category = nil)
    if category
      category.comics.where(published: true).first
    else
      Comic.where(published: true).first
    end
  end

  def next(category = nil)
    if !category.nil?
      category.comics.where(published: true).where("published_at > ?", published_at).last
    else
      Comic.where(published: true).where("published_at > ?", published_at).last
    end
  end

  def previous(category = nil)
    if !category.nil?
      category.comics.where(published: true).where("published_at < ?", published_at).first
    else
      Comic.where(published: true).where("published_at < ?", published_at).first
    end
  end
end
