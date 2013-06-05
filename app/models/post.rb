class Post < ActiveRecord::Base
  attr_accessible :body, :name, :title, :tag_list, :created_at
  acts_as_taggable
	
end
