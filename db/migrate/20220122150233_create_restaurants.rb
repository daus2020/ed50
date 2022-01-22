class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.integer :rating
      t.string :chef_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
