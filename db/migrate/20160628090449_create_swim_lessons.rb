class CreateSwimLessons < ActiveRecord::Migration
  def change
    create_table :swim_lessons do |t|
      t.string :code
      t.references :place, index: true, foreign_key: true
      t.references :level, index: true, foreign_key: true
      t.references :coach, index: true, foreign_key: true
      t.string :day
      t.time :startTime
      t.time :endTime
      t.integer :maxSubscriptions

      t.timestamps null: false
    end
  end
end
