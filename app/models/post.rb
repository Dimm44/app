class Post < ApplicationRecord
	include Visible

	belongs_to :user
	has_many :comments, dependent: :destroy


	has_many_attached :files do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
	has_one_attached :image
  has_rich_text :content

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

 	def archived?
    status == 'archived'
  end

end