class CreatePokemen < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemen do |t|
      t.string :name
      t.string :alias
      t.string :types
      t.string :abilities
      t.string :moves, array: true
      t.timestamps
    end
  end
end
