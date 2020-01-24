class IndexAllWorker
  include Sidekiq::Worker
  sidekiq_options retries: false

  def perform(models)
    return if models.empty?
    models.each do |klass|
      model = klass.constantize
      model.connection
      model.__elasticsearch__.create_index! force: true
      model.import
    end
  end
end
