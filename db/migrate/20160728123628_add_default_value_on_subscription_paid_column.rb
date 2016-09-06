class AddDefaultValueOnSubscriptionPaidColumn < ActiveRecord::Migration
  def change
    change_column :subscriptions, :paid, :boolean, default: false
  end
end
