namespace :db do

  desc 'Maintains database by running command as ANALYZE, VACUUM and REINDEX'
  task maintain: :environment do
    verbose = ENV['VERBOSE'].present?
    connection = ActiveRecord::Base.connection

    puts "Maintaining database #{connection.current_database} ..."
    connection.execute("VACUUM FULL #{'VERBOSE' if verbose}");
    connection.execute("ANALYZE #{'VERBOSE' if verbose}");
    connection.execute("REINDEX DATABASE #{connection.current_database}");
    puts "DONE."
  end

  desc 'Remigrate database and seed data'
  task remigrate: [:drop, :create, :migrate, :seed]

end
