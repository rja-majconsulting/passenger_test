class ChangeBirthDateColumnName < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :birtDate, :birthDate
  end
end
