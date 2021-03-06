module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    def re_index
      IndexerWorker.perform_async(self.class.table_name.singularize,  self.id, :index)
    end

    def delete_index
      IndexerWorker.perform_async(self.class.table_name.singularize, self.id, :delete)
    end
  end
end