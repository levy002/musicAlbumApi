class Api::V1::AlbumsController < ApplicationController
  def index
    albums = Album.all
    render json: { status: 'SUCCESS', data: albums, message: 'Albums loaded successfully!!' }, status: :ok
  end

  def create
    album = Album.new(album_params)
    if album.save
      render json: { status: 'SUCCESS', data: album, message: 'Album added successfully'}, status: :created
    else
      render json: album.errors, status: :unprocessable_entity
    end
  end

  def show
    album = Album.find(params[:id])
    render json: { status: 'SUCCESS', data: album, message: 'Album loaded succesfully!!'}, status: :ok
  end

  def update
    album = Album.find(params[:id])
    
    if album.update(album_params)
      render json: album, status: :ok
    else
      render json: album.errors, status: :unprocessable_entity
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy!
    render json: {message: 'Album deleted successfully'},status: :ok
  end

  private

  def album_params
    params.require(:albums).permit(:title, :photo, :artistName, :published, :label)
  end
end