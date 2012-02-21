module ApplicationHelper

  # return a title on a per-page basis
  def title
    base_title = site_name
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def site_name
    'Wenge'
  end
  
end
