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


Pokeman.destroy_all
Move.destroy_all
Item.destroy_all
Pokemon_move.destroy_all


uri_variable = URI("https://pokeapi.co/api/v2/pokemon/")
res = Net::HTTP.get_response(uri_variable)
data = JSON.parse(res.body, :headers => true, :encoding => "ISO-8859-1")
data["results"].each do |row|
    
    Pokeman.create(
        {
            name: row["name"],
            url: row["url"]
            
            
        }
    )
    
    
    
end
puts "added items to pokemen table"

csv_data = File.read(Rails.root.join('db/moves.csv'))
csv = CSV.parse(csv_data, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
    move = Move.new
    move.name = row["move"]
    move.description = row["description"]
    move.types = row["types"]
    move.category = row["category"]
    move.power = row["power"]
    move.accuracy = row["accuracy"]
    move.save
    
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


    


