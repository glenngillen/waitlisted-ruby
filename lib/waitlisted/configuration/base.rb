module Waitlisted
  module Configuration
    module Base
      if ENV['WAITLISTED_DOMAIN']
        @@configuration = OpenStruct.new(url: "https://#{ENV['WAITLISTED_DOMAIN']}")
      else
        @@configuration = OpenStruct.new
      end
      def configure(&block)
        yield configuration
      end

      def configuration
        @@configuration
      end
    end
  end
end
