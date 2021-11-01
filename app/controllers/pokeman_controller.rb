class PokemanController < ApplicationController

    def index
        #search by type1 or name
        if params[:type1].present?
            @pokemen = Pokeman.where(type1: params[:type1])
        elsif params[:name].present?
            @pokemen = Pokeman.where(name: params[:name])
        else
            @pokemen = Pokeman.all
        end

        @pokemen = @pokemen.page(params[:page]).per(10)
        
    end

    
    
    def search
        
        if params[:name].present?
            @pokemen = Pokeman.where(name: params[:name])
        else
            @pokemen = Pokeman.all
        end
    end

    

      #for dropdown menu search
     #   def search
     #       @pokemen = Pokeman.where(type1: params[:type1]) if params[:type1].present?
     #       render :index
     #   end
    
    
        private
    
        def pokeman_params
            params.require(:pokeman).permit(:name, :type1, :type2, :image, :description)
        end
    
    
    
      def show
        @pokeman = Pokeman.find(params[:id])
      end

end
