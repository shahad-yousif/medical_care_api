class CreatePharmacists < ActiveRecord::Migration[7.1]
  def change
    create_table :pharmacists do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :pharmacy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
