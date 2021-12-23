class CreateDisbursements < ActiveRecord::Migration[6.0]
  def change
    create_table :disbursements do |t|
      t.references :order, foreign_key: true, null: false, unique: true
      t.references :fee_configuration, foreign_key: true, null: false
      t.datetime :processed_at
      t.float :value
      t.string :status
    end
  end
end
