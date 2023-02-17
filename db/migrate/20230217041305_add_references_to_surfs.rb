class AddReferencesToSurfs < ActiveRecord::Migration[7.0]
  def change
    add_reference :surfs, :user, null: false, foreign_key: true
    add_reference :surfs, :board, null: false, foreign_key: true
    add_reference :surfs, :location, null: false, foreign_key: true
  end
end
