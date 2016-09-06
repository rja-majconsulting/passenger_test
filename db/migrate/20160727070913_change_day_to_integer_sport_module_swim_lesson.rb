class ChangeDayToIntegerSportModuleSwimLesson < ActiveRecord::Migration
  def change
    change_column :sport_modules, :day, :integer
    change_column :swim_lessons, :day, :integer
  end
end
