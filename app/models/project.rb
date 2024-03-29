class Project < ActiveRecord::Base
  	attr_accessible :body, :title, :photo, :tag_list, :created_at
  	acts_as_taggable

	  has_attached_file :photo,
	  	:path => "/project/:id/:style/:filename",
	  	:styles => {
	  		:thumb => "100x100",
	  		:medium => "200x200",
	  		:large => "600x400"
	  	}
end
