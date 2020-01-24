# README

### Running Elastic Search
* Download Elastic Search and run it on port `9200` preferably. confirm it is running with `curl -X GET "localhost:9200/?pretty"`
* seed the database with test data by running `rake db:seed` which automatically called the `IndexerWorker` and the ES is indexed
 hereon you can search the endpoints for
  1. bytags visiting the url `/searchbytags?tag=tag` would return at least 3 records matching the tags
  2. By tags and location the url `/searchtagsbylocation?tag=tag&long=0&lat=0` returns a record matching it
  {
    tags in the seed: ["tag 0", "tag 1", "tag 2"],
    title of posts: ["ruby 0", "ruby 1", "ruby 2"],
    longitudes: [0, 1, 2],
    latitudes: [0, 1, 2]
  }
* Create the index with this command `rake index:create` this would index Post, Tag and Tagging in the ES cluster
