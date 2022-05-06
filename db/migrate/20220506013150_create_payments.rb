class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount, null: false
      t.datetime :paid_at, null: false
      t.integer :kind, null: false
      t.string :name, default: "", null: false
      t.text :note, default: "", null: false

      t.timestamps
    end
  end
end
