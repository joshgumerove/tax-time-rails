class CreateReturns < ActiveRecord::Migration[6.0]
  def change
    create_table :returns do |t|
      t.integer :time_estimate
      t.date :due_date
      t.string :return_type
      t.string :description
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
