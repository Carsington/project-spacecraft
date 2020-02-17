class CreateSpaceships < ActiveRecord::Migration[5.2]
  def change
    create_table :spaceships do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.text :description
      t.string :main_pic_url
      t.integer :unit_price
      t.integer :size
      t.integer :max_speed
      t.integer :capacity

      t.timestamps
    end
  end
end
