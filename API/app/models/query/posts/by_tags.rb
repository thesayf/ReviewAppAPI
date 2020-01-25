module Query
  module Posts
    class ByTags
      def call(tag)
        {
          "query": {
            "nested": {
              "path": "tags",
               "query": {
                 "match": {
                   "tags.name": tag
                  }
                },
                "score_mode": "none"
            }
          }
        }

      end
    end
  end
end
