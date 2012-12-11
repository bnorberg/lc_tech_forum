class Post < ActiveRecord::Base
  attr_accessible :consultation_summary, :date, :patron_request, :resources_used, :status, :title, :created_at, :updated_at

  has_many :comments
 
end
