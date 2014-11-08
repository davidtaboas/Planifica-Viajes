class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :description
      t.integer :units
      t.float :priceperunit
      t.date :date
      t.integer :category
      t.references :trip, index: true

      t.timestamps
    end
  end
end
