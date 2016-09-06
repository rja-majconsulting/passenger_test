class CreateSportsTrainings < ActiveRecord::Migration
  def change
    # drop_table :sports_trainings
    create_table :sports_trainings do |t|
      t.string :code
      t.references :place, index: true, foreign_key: true
      t.date :startDate
      t.date :endDate
      t.time :startTime
      t.time :endTime
      t.decimal :halfDayPrice
      t.decimal :fullDayPrice
      t.string :morningNursery
      t.string :afternoonNursery

      t.timestamps null: false
    end
  end
end
