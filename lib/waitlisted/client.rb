module Waitlisted
  module Client
    def client
      puts Waitlisted.configuration.url.inspect
      raise StandardError, 
        "
        You must specify a waitlisted url in 
        the configuration block. 
        (http://mysite.app.waitlisted.co)
        " if Waitlisted.configuration.url.nil?
      Faraday.new(:url => Waitlisted.configuration.url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        # faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end