module PostsHelper
  
  def get_links(resources)
    links = resources.split(" ")
    if links.count <= 1
      content_tag :span, :class => 'test' do
        content_tag(:br) + link_to("#{links[0]}", "#{links[0]}") 
      end
    elsif links.count == 2
        content_tag :td, :class => 'test' do
          content_tag(:br) + link_to("#{links[0]}", "#{links[0]}") + content_tag(:br) + link_to("#{links[1]}", "#{links[1]}")
        end  
    elsif links.count == 3
      content_tag :td, :class => 'test' do
        content_tag(:br) + link_to("#{links[0]}", "#{links[0]}") + content_tag(:br) +  link_to("#{links[1]}", "#{links[1]}") + content_tag(:br) +  link_to("#{links[2]}", "#{links[2]}") 
      end
    elsif links.count == 4
      content_tag :td, :class => 'test' do
        content_tag(:br) + link_to("#{links[0]}", "#{links[0]}") + content_tag(:br) +  link_to("#{links[1]}", "#{links[1]}") + content_tag(:br) +  link_to("#{links[2]}", "#{links[2]}") + content_tag(:br) +  link_to("#{links[3]}", "#{links[3]}") 
      end
    elsif links.count == 5
      content_tag :td, :class => 'test' do
        content_tag(:br) + link_to("#{links[0]}", "#{links[0]}") + content_tag(:br) +  link_to("#{links[1]}", "#{links[1]}") + content_tag(:br) +  link_to("#{links[2]}", "#{links[2]}") + content_tag(:br) +  link_to("#{links[3]}", "#{links[3]}")  + content_tag(:br) +  link_to("#{links[4]}", "#{links[4]}") 
      end    
    end  
  end
  
end
