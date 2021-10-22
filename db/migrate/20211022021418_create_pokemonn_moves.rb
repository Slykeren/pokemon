class CreatePokemonnMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_moves do |t|
      t.int :pokemon_id
      t.int :move_id

      t.timestamps
    end
  end
end
