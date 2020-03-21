class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    # binding.pry
    if genre.save
      redirect_to admin_genres_path
    else
      @genre = genre
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      redirect_to admin_genres_path
    else
      @genre = Genre.find(genre_params)
      render 'edit'
    end
  end

private
  def genre_params
    params.require(:genre).permit(:genre,:display_status)
  end


end
