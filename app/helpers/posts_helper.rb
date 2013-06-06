module PostsHelper
  
  def get_links(resources)
    links = resources.split(" ")
    if links[0].match(/^http:\/\/.*/) 
      if links.count <= 1
        content_tag :span, :class => 'resource_links' do
          content_tag(:br) + link_to("#{links[0]}", "#{links[0]}", :target => '_blank') 
        end
      elsif links.count == 2
          content_tag :span, :class => 'resource_links' do
            content_tag(:br) + link_to("#{links[0]}", "#{links[0]}", :target => '_blank') + content_tag(:br) + link_to("#{links[1]}", "#{links[1]}", :target => '_blank')
          end  
      elsif links.count == 3
        content_tag :span, :class => 'resource_links' do
          content_tag(:br) + link_to("#{links[0]}", "#{links[0]}",:target => '_blank') + content_tag(:br) +  link_to("#{links[1]}", "#{links[1]}",:target => '_blank') + content_tag(:br) +  link_to("#{links[2]}", "#{links[2]}",:target => '_blank') 
        end
      elsif links.count == 4
        content_tag :span, :class => 'resource_links' do
          content_tag(:br) + link_to("#{links[0]}", "#{links[0]}",:target => '_blank') + content_tag(:br) +  link_to("#{links[1]}", "#{links[1]}",:target => '_blank') + content_tag(:br) +  link_to("#{links[2]}", "#{links[2]}",:target => '_blank') + content_tag(:br) +  link_to("#{links[3]}", "#{links[3]}", :target => '_blank') 
        end
      elsif links.count == 5
        content_tag :span, :class => 'resource_links' do
          content_tag(:br) + link_to("#{links[0]}", "#{links[0]}", :target => '_blank') + content_tag(:br) +  link_to("#{links[1]}", "#{links[1]}", :target => '_blank') + content_tag(:br) +  link_to("#{links[2]}", "#{links[2]}", :target => '_blank') + content_tag(:br) +  link_to("#{links[3]}", "#{links[3]}",:target => '_blank')  + content_tag(:br) +  link_to("#{links[4]}", "#{links[4]}", :target => '_blank') 
        end    
      end  
    end  
  end
  
end
