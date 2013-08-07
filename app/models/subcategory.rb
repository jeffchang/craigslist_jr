class Subcategory < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :maincategory
  has_many :posts
end
