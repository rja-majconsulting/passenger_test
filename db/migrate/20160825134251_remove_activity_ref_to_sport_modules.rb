class RemoveActivityRefToSportModules < ActiveRecord::Migration
  def change
    remove_reference(:sport_modules, :activity_id, index: true, foreign_key: true)
    rename_column(:sport_modules, :activity_id, :activity)
    change_column(:sport_modules, :activity, :string)
  end
end
