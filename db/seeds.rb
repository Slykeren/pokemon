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


#Pokeman. destroy_all
Move.destroy_all
#Item.destroy_all
#Pokemon_move.destroy_all

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
        puts "added item to moves table"
    end



