class CommentsController < ApplicationController

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @commentable = params[:commentable_class].constantize.find(params[:commentable_id])
    @comment = @commentable.comments.new(params[:comment])

    if @comment.save
      if params[:commentable_class] = "Photo"
        redirect_to album_photo_path(@commentable.album_id, @commentable.id), notice: 'Comment was successfully created.'
      else
        redirect_to [@album], notice: 'Comment was successfully created.'
      end
    else
      render action: "new"
    end
  end


end
