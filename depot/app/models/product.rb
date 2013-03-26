class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  validates_uniqueness_of :title
  validates_format_of :image_url,
  						:with => %r{\.(gif|jpg|png)$}i,
  						:message => 'must be a URL for GIF, JPG, or PNG image.'
  validate :price_must_be_at_least_a_cent
  attr_accessible :title, :description, :image_url, :price

  protected
  	def price_must_be_at_least_a_cent
  		errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
  	end
end