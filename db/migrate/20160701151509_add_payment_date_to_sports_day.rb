class AddPaymentDateToSportsDay < ActiveRecord::Migration
  def change
    add_column :sports_days, :paymentDate, :date
  end
end
