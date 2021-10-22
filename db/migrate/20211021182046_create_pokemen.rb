class CreatePokemen < ActiveRecord::Migration[6.1]
  def change
    create_table :pokeman do |t|
      t.string :name
      t.string :alias
      t.string :types
      t.string :type
      t.string :abilities
      t.string :moves, array: true
      t.timestamps
    end
  end
end
