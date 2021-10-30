class Pokeman < ApplicationRecord
    has_many :PokemonMove
    has_many :moves, through: :PokemonMove
    validates :name, presence: true
    
    #search by type1
    def self.search_by_type1(type1)
        Pokeman.where(type1: type1)
    end
    

end
