class CreateFinancialRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :financial_records do |t|
      t.string :name
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end
end
