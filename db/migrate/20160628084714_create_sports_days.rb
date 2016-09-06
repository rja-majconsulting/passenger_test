class CreateSportsDays < ActiveRecord::Migration
  def change
    create_table :sports_days do |t|
      t.string :code
      t.references :place, index: true, foreign_key: true
      t.date :date
      t.decimal :price
      t.time :startTime
      t.time :endTime
      t.string :morningPlace
      t.string :afternoonPlace

      t.timestamps null: false
    end
  end
end
