class CreateSurfs < ActiveRecord::Migration[7.0]
  def change
    create_table :surfs do |t|
      t.datetime :date
      t.text :notes
      t.boolean :surfed
      t.integer :rating

      t.timestamps
    end
  end
end
