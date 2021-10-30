class Move < ApplicationRecord
    has_many :PokemonMove
    has_many :pokemen, through: :PokemonMove
    validates :name, presence: true
   
    #search by name
    def self.search(search)
        if search
            where('name LIKE ?', "%#{search}%")
        else
            all
        end
    end

end
