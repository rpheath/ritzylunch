module ApplicationHelper
  def title(text)
    content_tag(:h1, text, :class => 'title')
  end
  
  def subtitle(text)
    content_tag(:h2, text, :class => 'sub-title')
  end
  
  def google_maps_javascript_include
    api_key = YAML::load(File.open(File.join(Rails.root, 'config', 'google_maps.yml')))[Rails.env]["api_key"]
    "<script type=\"text/javascript\" src=\"http://maps.google.com/maps?file=api&v=2&key=#{api_key}\"></script>"
  end
end