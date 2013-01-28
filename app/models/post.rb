class Post < ActiveRecord::Base
  attr_accessible :consultation_summary, :date, :patron_request, :resources_used, :status, :title, :created_at, :updated_at, :author, :user_id
  
  has_many :comments
  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum
  
end
