# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'net/http'
require 'json'
require 'pp'
require 'csv'
#require 'poke-api-v2'
require 'uri'

PokemonMove.destroy_all
Pokeman.destroy_all
Move.destroy_all
Item.destroy_all


csv_data = File.read(Rails.root.join('db/pokemon.csv'))
csv = CSV.parse(csv_data, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
    pkmn = Pokeman.new
    pkmn.name = row["Name"]
    pkmn.type1 = row["Type 1"]
    pkmn.type2 = row["Type 2"]
    pkmn.total = row["Total"]
    pkmn.generation = row["Generation"]
    pkmn.save
    
end
puts "added items to pokemn table"


uri_variable = URI("https://pokeapi.co/api/v2/move?limit=1118")
res = Net::HTTP.get_response(uri_variable)
data = JSON.parse(res.body, :headers => true, :encoding => "ISO-8859-1")


data["results"].each do |row|
    
    a = Move.create(
        {
            name: row["name"],
            url: row["url"]
            
            
        }
    )
    
    uri_variable2 = URI(a.url)
    res2 = Net::HTTP.get_response(uri_variable2)
    data2 = JSON.parse(res2.body, :headers => true, :encoding => "ISO-8859-1")

    data2["learned_by_pokemon"].each do |learnedby|
        
        move_of_poke = Pokeman.find_by(name: learnedby["name"].capitalize())

        PokemonMove.create(
            {
                pokeman: move_of_poke,
                move: a
            }
        )

    end
    
    
end
puts "added items to moves table"



    
    json_data = File.read(Rails.root.join('db/items.json'))
    json = JSON.parse(json_data, :headers => true, :encoding => "ISO-8859-1")
    json.each do |row|
        
        Item.create(
            {
                name: row[1]["name"],
                description: row[1]["desc"],
                sprite: row[1]["sprite"]
            }
        )
        
        
    end
    puts "added items to items table"


    


