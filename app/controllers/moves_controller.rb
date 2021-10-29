class MovesController < ApplicationController
  def index
    @moves = Move.all
  end

  def show
    @move = Move.find(params[:id])
    uri_variable = URI("#{@move.url}") 
    res = Net::HTTP.get_response(uri_variable) 
    data = JSON.parse(res.body, :headers => true, :encoding => "ISO-8859-1") 


    learned_by = Array.new
    data["learned_by_pokemon"].each do |learnedby|

      #poke = Pokeman.where(:name.downcase => learnedby["name"].downcase)
      poke = Pokeman.joins(:moves).where(:name => learnedby["name"])
      learned_by.push(poke)
    end

    
    
    @learned_by = learned_by
  end



end
