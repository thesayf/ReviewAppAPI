# README

### Running Elastic Search
* Download Elastic Search and run it on port `9200` preferably. confirm it is running with `curl -X GET "localhost:9200/?pretty"`
* Create the index with this command `rake index:create` this would index Post, Tag and Tagging in the ES cluster
