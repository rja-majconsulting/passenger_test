class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :alias
      t.string :street
      t.string :city
      t.integer :postalCode

      t.timestamps null: false
    end
  end
end
