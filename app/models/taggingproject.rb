class Taggingproject < ActiveRecord::Base
  belongs_to :tagproject
  belongs_to :project
  # attr_accessible :title, :body
end
