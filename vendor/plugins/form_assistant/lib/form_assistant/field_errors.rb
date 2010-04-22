module RPH
  module FormAssistant
    # extensions for formatting error messages
    #
    #   Ex: <%= errors %>
    #       <%= errors.to_s(:break => true) %>
    #       <%= errors.to_list %>
    #       <%= errors.to_list(:class => 'errorz') %>
    class FieldErrors < Array
      def to_s(options = {})
        return self.join('<br />') if options[:break]
        self.to_sentence
      end
  
      # converts an array into an unordered list
      def to_list(options = {})
        css_class = options.delete(:class) || 'errors'
    
        list_items = self.inject("") do |items, error|
          items << "<li>#{error}</li>"
        end
    
        return '<ul class="%s">%s</ul>' % [css_class, list_items]
      end
    end
  end
end    