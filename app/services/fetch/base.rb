module Fetch
  class Base
    def initialize(id)
      @id = id
    end

    def call
      raise NotImplementedError
    end

    def response
      resp = connection.get(url, params)

      data = JSON.parse(resp.body)

      raise_error(data)

      data
    end

    def url
      raise NotImplementedError
    end

    def params
      {
        api_key: Rails.application.secrets[:comic_vine_api_key],
        format: :json,
      }
    end

    def connection
      @conn ||= Faraday.new(url: 'https://www.comicvine.com') do |faraday|
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    def raise_error(data)
      raise "Response Error code: #{data['status_code']}" if data['status_code'] != 1
    end
  end
end
