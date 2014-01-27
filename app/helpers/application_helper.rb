module ApplicationHelper
  
  def full_title(page_title)
      base_title = "DemPoints"
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
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def username(user_id)
    User.find(user_id).username
  end



end
