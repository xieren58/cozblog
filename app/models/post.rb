class Post < ActiveRecord::Base
  acts_as_taggable
  
  validates :title, :presence => true
  validates :content, :presence => true
end
