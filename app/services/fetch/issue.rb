module Fetch
  class Issue < Base
    def call
      return true if ::Issue.where(comicvineid: @id).exists?

      ::Issue.create_from_api(response['results'])
    end

    def url
      sprintf(
        "/api/issue/4000-%<id>s/",
        id: @id
      )
    end
  end
end
