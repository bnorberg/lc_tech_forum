class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  
  has_reputation :votes,
       :source => [{ :reputation => :votes, :of => :posts }, { :reputation => :votes, :of => :comments }],
       :aggregated_by => :sum
  
  has_reputation :posts,
       :source => { :reputation => :votes, :of => :posts },
       :aggregated_by => :sum

   has_reputation :comments,
       :source => { :reputation => :votes, :of => :comments },
       :aggregated_by => :sum

  
  attr_accessible :username, :email, :password, :password_confirmation
  
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end
    
  def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.username = auth["info"]["name"]
        user.email = auth["info"]["email"]
        user.access_token = auth["credentials"]["token"]
        user.secret = auth["credentials"]["secret"]
        user.save
      end
  end

  def voted_for?(post)
    evaluations.where(target_type: post.class, target_id: post.id).present?
  end
   # validates_confirmation_of :password
    #validates_presence_of :password, :on => :create
    #validates_presence_of :username
    #validates_uniqueness_of :username
    #validates_presence_of :email
   # validates_uniqueness_of :email
end
