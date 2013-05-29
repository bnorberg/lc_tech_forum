module ApplicationHelper
  
  def avatar_url(user)
    if current_page?(posts_path) || current_page?(root_path)
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}?s=24&d=retro"
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}?s=84&d=retro"
    end
   end
end
