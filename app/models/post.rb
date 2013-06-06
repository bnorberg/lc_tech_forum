class Post < ActiveRecord::Base
  attr_accessible :consultation_summary, :date, :patron_request, :resources_used, :status, :title, :created_at, :updated_at, :author, :user_id
  
  has_many :comments
  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  include PgSearch
  pg_search_scope :search, against: [[:title, 'A'], [:consultation_summary, 'B'], [:patron_request, 'C'], :author],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {comments: [[:title, 'A'], [:consultation_summary, 'B'], [:patron_request, 'C'], :author]}

  def self.text_search(search)
    if search.present?
      search(search)
    else
      scoped  
    end
  end
      
###for solr indexing  
 # searchable do
#    text :title, :default_boost => 2
#    text :author
#    text :patron_request
#    text :consultation_summary, :boost => 1
#    text :resources_used, :boost => 3
 #   time :updated_at
#    text :comments_summary, :boost => 1 do
#        comments.map(&:consultation_summary)
 #   end
  #  text :comments_author do
 #       comments.map(&:author)
 #   end
 #   text :comments_request do
 #       comments.map(&:patron_request)
 #   end
 #   text :comments_resources, :boost => 3 do
 #       comments.map(&:resources_used)
 #   end  
 # end
  
end
