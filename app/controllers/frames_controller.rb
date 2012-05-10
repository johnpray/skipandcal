class FramesController < ApplicationController

	before_filter :admin

	def index
    @comic = Comic.find(params[:comic_id])
    @frames = @comic.frames
  end

  def show
    @frame = Frame.find(params[:id])
    redirect_to comic_frames_path(@frame.comic)
  end

  def new
    @comic = Comic.find(params[:comic_id])
    @frame = @comic.frames.build
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @frame = @comic.frames.build(params[:frame])
    if @frame.save
      flash[:success] = "Frame uploaded."
      redirect_to comic_frames_path(@comic)
    else
      flash[:error] = "Frame could not be saved. See error messages below and try again."
      render 'new'
    end
  end

  def edit
    @frame = Frame.find(params[:id])
    @comic = @frame.comic
  end

  def update
    @frame = Frame.find(params[:id])
    if @frame.update_attributes(params[:frame])
      flash[:success] = "Frame uploaded."
      redirect_to comic_frames_path(@frame.comic)
    else
      flash[:error] = "Frame could not be saved. See error messages below and try again."
      render 'edit'
    end
  end

  def destroy
    frame = Frame.find(params[:id])
    Frame.find(params[:id]).destroy
    flash[:success] = "Frame destroyed now and forever."
    redirect_to comic_frames_path(frame.comic)
  end

  private

    def admin
      if !admin?
        redirect_to root_path
      end
    end

end
