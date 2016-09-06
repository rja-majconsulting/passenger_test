# require File.dirname(__FILE__) +  "/activities_importer"
# require File.dirname(__FILE__) +  "/coaches_importer"
# require File.dirname(__FILE__) +  "/levels_importer"
# require File.dirname(__FILE__) +  "/places_importer"
# require File.dirname(__FILE__) +  "/sport_module_importer"
# require File.dirname(__FILE__) +  "/sport_days_importer"
# require File.dirname(__FILE__) +  "/sport_training_importer"
# require File.dirname(__FILE__) +  "/swim_lesson_importer"
# require File.dirname(__FILE__) +  "/subscriptions_importer"
#
# class Importer
#
#   # include sub-modules
#   include ActivitiesImporter
#   include CoachesImporter
#   include LevelsImporter
#   include PlacesImporter
#   include SportModuleImporter
#   include SportDayImporter
#   include SportTrainingImporter
#   include SwimLessonImporter
#   include SubscriptionsImporter
#
#
#   # initializer for a new importer
#   def initialize new, old
#     # feedback for the programmer
#     puts "Importing from #{old} to #{new}"
#
#     @newDb = new
#     @oldDb = old
#   end
#
#   # execute the import
#   def execute
#
#     # if you do not like to import data, if the new database
#     # already contains data, just a security hint..
#     # if Activity.count > 0
#     #   raise "Import aborted! There already are activities in the database."
#     # end
#     #
#     # if Coach.count > 0
#     #   raise "Import aborted! There already are coaches in the database."
#     # end
#     #
#     # if Level.count > 0
#     #   raise "Import aborted! There already are levels in the database."
#     # end
#     #
#     # if Place.count > 0
#     #   raise "Import aborted! There already are places in the database."
#     # end
#     #
#     # if SportModule.count > 0
#     #   raise "Import aborted! There already are modules in the database."
#     # end
#     #
#     # if SportsDay.count > 0
#     #   raise "Import aborted! There already are days in the database."
#     # end
#
#     # if SportsTraining.count > 0
#     #   raise "Import aborted! There already are trainings in the database."
#     # end
#
#     # if SwimLesson.count > 0
#     #   raise "Import aborted! There already are lessons in the database."
#     # end
#
#     if Subscription.count > 0
#       raise "Import aborted! There already are subscriptions in the database."
#     end
#
#     # import_activities
#     # import_coaches
#     # import_levels
#     # import_places
#     # import_sport_module
#     # import_sport_day
#     # import_sport_training
#     # import_swim_lesson
#     import_subscriptions
#   end
# end
#
#
# # custom mysql row to facilite access
# class Row
#   def initialize fields, values
#     @fields = fields
#     @values = values
#   end
#
#   def get field
#     @values[@fields.index(field)]
#   end
# end
#
# # Add get_row method to Mysql2::Result class
# class Mysql2::Result
#   def get_row index
#     Row.new self.fields, self.to_a[index].to_a
#   end
#
#   def get_rows
#     Row.new self.fields, self.to_a[index].to_a
#   end
# end