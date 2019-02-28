class AlbumsController < ApplicationController

    def new 
        @current_band = Band.find_by(id: params[:band_id])
        @bands = Band.all
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash[:errors] = ["Invalid info"]
            redirect_to bands_url 
        end
    end

    def edit
        @bands = Band.all
        @album = Album.find_by(id: params[:id])
        render :edit
    end

    def show
        @album = Album.find_by(id: params[:id])
        if @album
            render :show
        else
            redirect_to bands_url
        end
    end

    def update
        @band = Band.all
        @album = Album.find_by(id: params[:id])
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash[:errors] = ["Invalid input"]
            redirect_to album_url(@album)
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        @album.destroy
        redirect_to bands_url
    end

    private
    def album_params
        params.require(:album).permit(:band_id, :title, :year, :live)
    end
end
