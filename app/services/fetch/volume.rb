module Fetch
  class Volume < Base
    def call
      return true if ::Volume.where(comicvineid: @id).exists?

      ::Volume.create_from_api(response["results"])

      fetch_new_issues_for_volume
    end

    def url
      sprintf(
        "/api/volume/4050-%<id>s/",
        id: @id
      )
    end

    def fetch_new_issues_for_volume
      NewIssues.new(@id).call
    end
  end
end
