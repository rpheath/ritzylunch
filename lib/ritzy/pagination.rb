module Ritzy
  module Pagination
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def paginated(page, options = {})
        paginate(:all, {
          :page => page,
          :per_page => options[:per_page] || 15
        }.merge(options))
      end
    end
  end
end