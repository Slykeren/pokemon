class CreatePokemen < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemen do |t|
      t.string :name
      t.string :type
      t.string :abilities

      t.timestamps
    end
  end
end
