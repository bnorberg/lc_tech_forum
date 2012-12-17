class Comment < ActiveRecord::Base
  acts_as_votable
  attr_accessible :consultation_summary, :date, :patron_request, :post_id, :resources_used, :status, :title, :created_at, :updated_at, :author
  
  belongs_to :post
end
