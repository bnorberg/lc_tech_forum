class User < ActiveRecord::Base
  #authenticates_with_sorcery!
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

    
   # validates_confirmation_of :password
    #validates_presence_of :password, :on => :create
    #validates_presence_of :username
    #validates_uniqueness_of :username
    #validates_presence_of :email
   # validates_uniqueness_of :email
end
