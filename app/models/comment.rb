class Comment < ActiveRecord::Base
  attr_accessible :consultation_summary, :date, :patron_request, :post_id, :resources_used, :status, :title, :created_at, :updated_at, :author, :user_id
  
  belongs_to :post
  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum
end
