class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.boolean :private

      t.timestamps
    end
  end
end
