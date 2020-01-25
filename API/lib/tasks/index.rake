namespace :index do
  desc 'create the indexes for the specified models'
  task :create => :environment do
    MODELS_TO_INDEX = %w(Post Tag Tagging)
    IndexAllWorker.perform_async MODELS_TO_INDEX
  end
end
