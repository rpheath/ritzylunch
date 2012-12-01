#['will_paginate', 'redcloth'].each { |lib| require lib }

module Rails
  module Rack
    class LogTailer

      #
      # Override this method so that we can make sure the file it wants is there 
      # and we don't get errors on startup.
      #
      alias_method :original_initialize, :initialize
      def initialize(app, log = nil)

        if (log.nil?)
          path = Pathname.new(EnvironmentLog).cleanpath

          File.open(path, 'w') if !File.exists?(path)
        end

        original_initialize(app)
      end
    end
  end
end