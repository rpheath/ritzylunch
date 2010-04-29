module ApplicationHelper
  def title(text)
    content_tag(:h1, text, :class => 'title')
  end
  
  def subtitle(text)
    content_tag(:h2, text, :class => 'sub-title')
  end
  
  def list(options = {}, &block)
    concat(content_tag(:ul, capture(&block), :class => ['list', options[:class]].join(' ')))
  end
  
  def google_maps_javascript_include
    api_key = YAML::load(File.open(File.join(Rails.root, 'config', 'google_maps.yml')))[Rails.env]["api_key"]
    "<script type=\"text/javascript\" src=\"http://maps.google.com/maps?file=api&v=2&key=#{api_key}\"></script>"
  end
  
  def js_for_sortable_list(options = {})
    hidden_ids_html = options[:hidden_field] || '#item_ids_'
    
    content_for :head do
      javascript_include_tag('jquery-ui-sortable.min') +
      javascript_tag do
        "$(function() {" +
          "$('ul.sortable').sortable({" +
            "handle: 'span.handle'," +
            "axis: 'y'," +
            "update: function(e, ui) {" +
              "$(this).find('li').removeClass('odd').end().find('li:even').addClass('odd');" +
              "var ids = $(this).find('li').map(function(ids) { return this.id }).get().join(',');" +
              "$('#{hidden_ids_html}').val(ids);" +
            "}" +
          "})" +
        "});"
      end
    end
  end
end