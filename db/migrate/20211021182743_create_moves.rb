class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :move do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :category
      t.integer :power
      t.integer :accuracy

      t.timestamps
    end
  end
end
