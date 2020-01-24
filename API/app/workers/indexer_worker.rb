class IndexerWorker
  include Sidekiq::Worker
  sidekiq_options retries: false

  Logger = Sidekiq.logger.level == Logger::DEBUG ? Sidekiq.logger : nil
  Client = Elasticsearch::Client.new host: 'localhost:9200', logger: Logger

  def perform(resource, resource_id, operation)
    logger.debug [operation, "ID: #{resource_id}"]
    model = resource.titlecase.constantize
    model.connection

    resource.downcase!

    case operation.to_s
      when /index/
        record = model.find(resource_id)
        Client.index  index: resource.pluralize, id: record.id, body: record.__elasticsearch__.as_indexed_json
      when /delete/
        begin
          Client.delete index: resource.pluralize, id: resource_id
        rescue Elasticsearch::Transport::Transport::Errors::NotFound
          logger.debug "Article not found, ID: #{resource_id}"
        end
      else raise ArgumentError, "Unknown operation '#{operation}'"
    end
  end
end
