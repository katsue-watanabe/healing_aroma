class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.datetime :start_time
      t.date :day, null: false
      t.string :time, null: false
      t.bigint :user_id, null: false
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
      t.datetime :start_time, null: false
      t.index [:user_id], name: :index_reservations_on_user_id

      t.timestamps
    end
  end
end
