class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.boolean :status
      t.string :cat
      t.date :date
      t.references :trip, index: true

      t.timestamps
    end
  end
end
