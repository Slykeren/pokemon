class Pokeman < ApplicationRecord
    has_many :PokemonMove
    has_many :moves, through: :PokemonMove
    validates :name, presence: true
    
end
