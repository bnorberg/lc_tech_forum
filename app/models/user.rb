class User < ActiveRecord::Base
  #has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_many :posts
  has_many :comments
  
  has_reputation :expertise,
        :source => [
            { :reputation => :posts},
            { :reputation => :comments }], :aggregated_by => :sum

    has_reputation :posts,
        :source => [{ :reputation => :votes, :of => :posts }, { :reputation => :votes, :of => :comments }], :aggregated_by => :sum

    has_reputation :comments,
        :source => { :reputation => :votes, :of => :comments }
  
  #has_reputation :votes, source: {reputation: :votes, of: :comments}, aggregated_by: :sum
  
  attr_accessible :username, :email, :password, :password_confirmation
  
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end
    
  def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.username = auth["info"]["name"]
      end
  end

  def voted_for?(haiku)
    evaluations.where(target_type: haiku.class, target_id: haiku.id).present?
  end
   # validates_confirmation_of :password
    #validates_presence_of :password, :on => :create
    #validates_presence_of :username
    #validates_uniqueness_of :username
    #validates_presence_of :email
   # validates_uniqueness_of :email
end
