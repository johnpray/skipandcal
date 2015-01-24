class Frame < ActiveRecord::Base
  attr_accessible :alt_text, :comic_id, :order, :title_text, :image

  belongs_to :comic

  has_paper_trail

  has_attached_file :image,
									styles: {
										large: '1000x1000>',
										medium: '500x500>',
										small: '300x300>',
										thumb: '300x300#'
									},
									storage: :s3,
									s3_credentials: S3_CREDENTIALS,
									s3_protocol: :http

  validates_attachment :image, content_type: {
  										 content_type: ['image/jpeg', 'image/png', 'image/gif'] },
  										 presence: true

  default_scope order: '"order" ASC, created_at ASC'

  def image_url
    image.url
  end
end
