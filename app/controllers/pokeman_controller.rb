class PokemanController < ApplicationController

    def index
        @pokemen = Pokeman.all
      end
    
      def show
        @pokemen = Pokeman.find(params[:id])
      end

end
