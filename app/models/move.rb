class Move < ApplicationRecord
    has_many :PokemonMove
    has_many :pokemen, through: :PokemonMove
    validates :name, presence: true
   
    def self.search(search)
        if search
            move = Move.find_by(name: search)
            if move
                self.where(id: move)
            else 
                Move.all
            end
        else
            Move.all
        end
    end

end
