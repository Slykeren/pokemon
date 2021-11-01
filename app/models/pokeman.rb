class Pokeman < ApplicationRecord
    has_many :PokemonMove
    has_many :moves, through: :PokemonMove
    validates :name, presence: true
    

    def self.search_by_type1(type1)
        Pokeman.where(type1: type1)
    end


    def self.search_by_name(name)
        Pokeman.where(name: name)
    end

    

end
