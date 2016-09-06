require File.expand_path(File.dirname(__FILE__) + "/../../../config/environment")

namespace :vivasport do
  require Rails.root + "lib/tasks/import/importer"

  desc "Import old database, usage: rake project_name:import['old_database_name']"
  task :import, [:oldDatabase] => :environment do |t, args|
    args.with_defaults(oldDatabase: "vivasport_old")

    oldDatabaseName = args.oldDatabase
    newDatabaseName = YAML::load(IO.read(Rails.root.join("config/database.yml")))[Rails.env]["database"]

    importer = Importer.new newDatabaseName, oldDatabaseName
    importer.execute
  end
end