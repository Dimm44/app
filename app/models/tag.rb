class Tag < ApplicationRecord
	attr_accessor :name
  has_many :taggings
  has_many :post, through: :taggings
end
