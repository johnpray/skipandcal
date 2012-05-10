class ComicsController < ApplicationController

  #before_filter :admin,  except: [:index, :show]

  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])

    if request.path != comic_path(@comic)
      redirect_to @comic, status: :moved_permanently
    end
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(params[:comic])
    if @comic.save
      flash[:success] = "Comic saved."
      redirect_to @comic
    else
      render 'new'
    end
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(params[:comic])
      flash[:success] = "Comic updated."
      redirect_to @comic
    else
      render 'edit'
    end
  end

  def destroy
    Comic.find(params[:id]).destroy
    flash[:success] = "Comic obliterated."
    redirect_to comics_path
  end
end
