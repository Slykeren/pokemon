class PokemonMove < ApplicationRecord
    has_one :Move
    has_one :Pokeman

end
