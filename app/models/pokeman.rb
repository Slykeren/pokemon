class Pokeman < ApplicationRecord
    has_many :PokemonMove
    has_many :moves, through: :PokemonMove
    validates :name, presence: true
    
    def self.search(search)
        if search
            pokemen = Pokeman.find_by(type1: search)
            if pokemen
                self.where(type1: pokemen)
            else 
                Pokeman.all
            end
        else
            Pokeman.all
        end
    end

end
