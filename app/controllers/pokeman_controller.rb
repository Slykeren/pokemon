class PokemanController < ApplicationController

    def index
        @pokemen = Pokeman.all
      end
    
      def show
        @pokeman = Pokeman.find(params[:id])
      end

end
