class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :type
      t.string :lastName
      t.string :firstName
      t.date :birtDate
      t.string :street
      t.string :city
      t.integer :postalCode
      t.string :telefonNumber
      t.string :email
      t.text :comment
      t.boolean :paid
      t.references :sport_module, index: true, foreign_key: true
      t.references :sports_training, index: true, foreign_key: true
      t.references :swim_lesson, index: true, foreign_key: true
      t.references :sports_day, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
      t.references :level, index: true, foreign_key: true
      t.references :activity_morning, index: true, foreign_key: true
      t.references :activity_afternoon, index: true, foreign_key: true
      t.date :dueDate

      t.timestamps null: false
    end
  end
end
