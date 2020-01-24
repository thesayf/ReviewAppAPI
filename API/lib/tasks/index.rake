namespace :index do
  desc 'create the indexes for the specified models'
  task :create do
    MODELS_TO_INDEX = %w(Post Tag Tagging)
    IndexAllWorker.new.perform MODELS_TO_INDEX
  end
end
