module Query
  module Posts
    class ByTagsAndLocation
      def call(tag, long, lat)
        long = long.to_i
        lat = lat.to_i

        {
          "query": {
            "bool": {
              "must": [
                {
                  "match": {
                    "longitude": long
                  }
                },
                {
                  "match": {
                    "latitude": lat
                  }
                },
                {
                  "nested": {
                    "path": "tags",
                    "query": {
                      "match": {
                        "tags.name": tag
                      }
                    }
                  }
                }
              ]
            }
          }
        }

      end
    end
  end
end
