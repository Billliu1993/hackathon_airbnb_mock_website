class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bed_room
      t.integer :bed
      t.integer :bath_room
      t.string :listing_name
      t.text :description
      t.string :address
      t.boolean :is_wifi
      t.boolean :is_tv
      t.boolean :is_dryer
      t.boolean :is_heating
      t.boolean :is_co
      t.integer :price
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
