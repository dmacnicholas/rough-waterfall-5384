class SupermarketsController < ApplicationController
    def show
        @supermarket = Supermarket.find(params[:id])
    end

    def index

    end  
end
