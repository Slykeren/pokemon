class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.string :move
      t.text :description
      t.string :type
      t.string :category
      t.int :power
      t.int :accuracy

      t.timestamps
    end
  end
end
