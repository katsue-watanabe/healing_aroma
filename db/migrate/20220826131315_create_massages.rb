class CreateMassages < ActiveRecord::Migration[5.1]
  def change
    create_table :massages do |t|
      t.string :aroma
      t.string :menu
      t.text :explantion
      t.integer :price
      t.references :reservation, foreign_key: true

      t.timestamps
    end
  end
end
