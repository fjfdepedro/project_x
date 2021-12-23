class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email
      t.string :cif
      t.string :status
      t.references :fee_configurations_type, foreign_key: true, null: false
      t.timestamps
    end
  end
end
