class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :lastName
      t.string :firstName
      t.string :telefonNumber
      t.string :email

      t.timestamps null: false
    end
  end
end
