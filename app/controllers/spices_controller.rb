class SpicesController < ApplicationController
 
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
 
    def index
      spices = Spice.all
      render json: spices
    end
    
    def create
      spices = Spice.create(spices_params)
      render json: spices, status: :created
    end
    
    # def show
    #   spices = find_spices
    #   render json: spices
    # end
    
    def update
      spices = find_spices
      spices.update(spices_params)
      render json: spices
    end
    
    def destroy
      spices = find_spices
      spices.destroy
      render json: {}
    end
    
    private
    
    def spices_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
      
    def find_spices
        Spice.find(params[:id])
    end
      
    def render_not_found_response
        render json: { error: "spices not found" }, status: :not_found
    end 
end
