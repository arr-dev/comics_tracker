if Rails.env.development? || Rails.env.test?
  namespace :brakeman do
    desc "Run Brakeman"
    task :run, :output_files do |_, args|
      require "brakeman"

      files = args[:output_files].split(" ") if args[:output_files]
      Brakeman.run(
        app_path: ".",
        output_files: files,
        print_report: true,
        quiet: true,
        run_all_checks: true,
        output_format: :to_tabs
      )
    end
  end
end
