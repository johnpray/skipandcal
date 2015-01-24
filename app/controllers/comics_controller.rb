class ComicsController < ApplicationController

  before_filter :admin,  except: [:index, :show, :feed]

  respond_to :html, :json

  def index
    @category = Category.find(params[:category]) if params[:category]
    @comics = @category ? @category.comics : Comic.all

    respond_to do |format|
      format.html
      format.json { render json: @comics }
    end
  end

  def show
    unless params[:id].nil?
      @comic = Comic.find(params[:id])
    else
      @root = true
      @comic = Comic.newest
    end
    @category = Category.find(params[:category]) if params[:category]

    if !admin? && !@comic.published
      flash[:error] = "You don't have access to that. Sorry."
      redirect_to comics_path
    end

    if request.path != comic_path(@comic, format: params[:format]) && request.path != root_path
      redirect_to comic_path(@comic, format: params[:format]), status: :moved_permanently
    end

    respond_to do |format|
      format.html
      format.json { render json: @comic }
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
