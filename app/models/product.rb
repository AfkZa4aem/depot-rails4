class Product < ActiveRecord::Base
  # check title, description, image not blank
  validates :title, :description, :image_url, presence: true

  # check that price is number and >= 0.01
  validates :price, numericality: {greater_then_or_equal_to: 0.01}

  # check that title is uniq
  validates :title, uniqueness: true

  # check that image is gif, jpg, or png format
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: "URL should specify to image format: GIF, JPG or PNG."
  }
end
