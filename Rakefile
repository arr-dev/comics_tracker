require File.expand_path("../config/application", __FILE__)

if Rails.env.development? || Rails.env.test?
  require "rubocop/rake_task"
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.options = ["--display-cop-names"]
  end

  task precommit: %w(rubocop brakeman:run bundler:audit)
end

Rails.application.load_tasks
