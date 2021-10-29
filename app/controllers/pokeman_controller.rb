class PokemanController < ApplicationController

    def index
        @pokemen = Pokeman.search(params[:name])
        @pokemen = Pokeman.where(type1: params[:type1]) if params[:type1].present?
    
      end
    
      def show
        @pokeman = Pokeman.find(params[:id])
      end

end
