class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :colour, presence: true
  validates :price, presence: true

  has_many :orders
  has_many :comments
  def self.search(search_term)
    like_string = Rails.env.production? ? "ilike" : "LIKE"
    Product.where("name #{like_string} ?", "%#{search_term}%")
  end

  def highest_rating_comment
    comments.rating_desc.first.rating
  end

  def lowest_rating_comment
    comments.rating_asc.first.rating
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def views
    $redis.get("product:#{id}")
  end

  def viewed!
    $redis.incr("product:#{id}")
  end

end
