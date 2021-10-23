class Pokeman < ApplicationRecord
    has_many :PokemonMove

    validates :name, presence: true
    validates :alias, presence: true
end
