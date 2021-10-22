class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :move do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :category
      t.int :power
      t.int :accuracy

      t.timestamps
    end
  end
end
