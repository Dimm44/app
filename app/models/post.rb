class Post < ApplicationRecord
	include Visible
  
  attr_accessor :content, :name, :tag_list
  has_many :taggings
  has_many :tags, through: :taggings

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

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end