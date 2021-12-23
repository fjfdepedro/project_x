class CreateFeeConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :fee_configurations do |t|
      t.references :fee_configurations_type, foreign_key: true, null: false
      t.float :fee_percentage
      t.integer :min_amount
      t.integer :max_amount
      t.timestamps
    end
  end
end
