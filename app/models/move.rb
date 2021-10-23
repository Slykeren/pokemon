class Move < ApplicationRecord
    has_many :PokemonMove
    has_many :pokemen, through: :PokemonMove
    validates :name, presence: true
    
end
