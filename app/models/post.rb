class Post < ActiveRecord::Base
  acts_as_votable
  attr_accessible :consultation_summary, :date, :patron_request, :resources_used, :status, :title, :created_at, :updated_at, :author
  
  has_many :comments
 
end
