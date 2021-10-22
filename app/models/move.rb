class Move < ApplicationRecord
    has_many :PokemonMove

    validates :name, presence: true
    validates :type, presence: true
end
