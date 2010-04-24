module Textilizer
  def self.included(klass)
    klass.extend ClassMethods
  end
  
  module ClassMethods		
		# textilize: used to automatically convert text to textile
		# 
		# Example usage (at the top of any model):
		#
		# textilize :about, :body, :profile_text
		#
		# Note: the above would assume these columns exist
		# 				NORMAL				TEXTILED
		# 	 			-------------------------------
		# 				about 				about_html
		# 			  body					body_html
		# 			  profile_text	profile_text_html
		def textilize(*columns)
			methods = []
			suffix  = columns.last.is_a?(Hash) ? columns.pop.values.last : 'html'
			
			columns.each do |column|
				define_method "#{column}_to_html" do
					self["#{column}_#{suffix}"] = RedCloth.new(self[column] || '').to_html
				end
				methods << "#{column}_to_html".to_sym
			end
			
			before_save *methods
		end
	end
end