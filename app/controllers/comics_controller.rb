class ComicsController < ApplicationController

  before_filter :admin,  except: [:index, :show, :feed]

  def index
    if request.path != root_path
      redirect_to root_path and return
    end
    if params[:category] && params[:order] = 'old-first'
      @category = Category.find(params[:category])
      @comic = @category.comics.reorder('published_at ASC').first
    elsif params[:category]
      @category = Category.find(params[:category])
      @comic = @category.comics.first
    else
      @comic = Comic.newest
      @news = true
    end
    render 'show'
  end

  def show
    @comic = Comic.find(params[:id])
    @category = Category.find(params[:category]) if params[:category]

    if !admin? && !@comic.published
      flash[:error] = "You don't have access to that. Sorry."
      redirect_to comics_path
    end

    if request.path != comic_path(@comic) && request.path != comics_path
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

  def feed
    @title = "Skip & Cal ~ cartoons and comics by John Pray"
    @comics = Comic.where(published: true).order('published_at DESC')
    @updated = @comics.reorder('updated_at DESC').first.updated_at unless @comics.empty?

    respond_to do |format|
      format.atom
      format.rss { redirect_to feed_path(format: :atom), status: :moved_permanently }
    end
  end

end
