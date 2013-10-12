module ApplicationHelper
  
  def full_title(page_title)
      base_title = "DemPoints - Your infinite leg up network"
      if page_title.empty?
        base_title
      else
        "#{base_title} - #{page_title}".html_safe
      end
  end

  def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-error"
          when :alert then "alert alert-error"
      end
  end
  
  def url_with_protocol(url)
     /^http/.match(url) ? url : "http://#{url}"
  end



end
