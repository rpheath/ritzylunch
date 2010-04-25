module ApplicationHelper
  def title(text)
    content_tag(:h1, text, :class => 'title')
  end
  
  def subtitle(text)
    content_tag(:h2, text, :class => 'sub-title')
  end
end