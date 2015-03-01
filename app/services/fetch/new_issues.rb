module Fetch
  class NewIssues < Base
    def initialize(volume_id)
      @volume_id = volume_id
    end

    def call
      response["results"].each do |result|
        next if ::Issue.where(comicvineid: result["id"]).exists?

        Fetch::Issue.new(result["id"]).call
      end
    end

    def url
      "/api/issues/"
    end

    def params
      super.merge(
        filter: "volume:#{@volume_id}",
        field_list: "id"
      )
    end
  end
end
