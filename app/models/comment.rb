class Comment < ActiveRecord::Base
  attr_accessible :consultation_summary, :date, :patron_request, :post_id, :resources_used, :status, :title, :created_at, :updated_at
  
  belongs_to :post
end
