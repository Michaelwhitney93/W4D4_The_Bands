class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band)
        else
            flash.now[:errors] = ["Band already exists"]
            render :new 
        end
    end

    def new
        render :new
    end

    def show
        @band = Band.find_by(id: params[:id])
        if @band 
            render :show
        else
            redirect_to bands_url
        end
    end

    def edit
        @band = Band.find_by(id: params[:id])
        render :edit
    end

    def update
        @band = Band.find_by(id: params[:id])
        @band.update(band_params)
        redirect_to band_url(@band)
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        if @band 
            @band.destroy
            redirect_to bands_url 
        else
            redirect_to bands_url
        end
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
