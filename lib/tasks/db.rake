namespace :db do
  desc "Kill all connections to test database"
  task kill_test_connections: :environment do
    db_name = "#{Rails.application.class.module_parent_name.underscore}_test"
    query = <<-SQL
      SELECT pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE datname = '#{db_name}'
        AND pid <> pg_backend_pid();
    SQL

    ActiveRecord::Base.connection.execute(query)
    puts "All connections to #{db_name} terminated."
  end
end