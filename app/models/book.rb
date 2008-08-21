class Book < ActiveRecord::Base
  belongs_to :author
  
  validates_uniqueness_of :title
  validates_length_of :title, :within => 5..120
end
