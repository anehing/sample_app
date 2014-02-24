module ApplicationHelper
  def full_title (page_title)
    if page_title.empty? then 
      "Ruby on Rails Tutorial Sample App"
      else
       "Ruby on Rails Tutorial Sample App | #{page_title} "
     end
         
  end
  
end
