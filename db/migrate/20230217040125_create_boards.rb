class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.integer :length
      t.integer :volume

      t.timestamps
    end
  end
end
