class CreateSportModules < ActiveRecord::Migration
  def change
    create_table :sport_modules do |t|
      t.string :code
      t.references :place, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true
      t.references :coach, index: true, foreign_key: true
      t.string :day
      t.time :startTime
      t.time :endTime
      t.integer :maxSubscriptions
      t.string :meetingPlace

      t.timestamps null: false
    end
  end
end
