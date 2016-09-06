class CreateSportsTrainingActivities < ActiveRecord::Migration
  def change
    create_table :sports_training_activities do |t|
      t.references :sports_training, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true
      t.string :period

      t.timestamps null: false
    end
  end
end
