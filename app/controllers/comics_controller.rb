class ComicsController < ApplicationController

  before_filter :admin,  except: [:index, :show]

  def index
    if params[:collection]
      @category = Category.find(params[:collection])
      if params[:order] == "old-first"
        if admin?
          @comics = @category.comics.reorder('published_at ASC').page(params[:page])
        else
          @comics = @category.comics.where(published: true).reorder('published_at ASC').page(params[:page])
        end
      else
        if admin?
          @comics = @category.comics.page(params[:page])
        else
          @comics = @category.comics.where(published: true).page(params[:page])
        end
      end
    else
      if params[:order] == "old-first"
        if admin?
          @comics = Comic.reorder('published_at ASC').page(params[:page])
        else
          @comics = Comic.where(published: true).reorder('published_at ASC').page(params[:page])
        end
      else
        if admin?
          @comics = Comic.page(params[:page])
        else
          @comics = Comic.where(published: true).page(params[:page])
        end
      end
    end
  end

  def show
    @comic = Comic.find(params[:id])

    if !admin? && !@comic.published
      flash[:error] = "You don't have access to that. Sorry."
      redirect_to comics_path
    end

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
