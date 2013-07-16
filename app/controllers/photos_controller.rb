class PhotosController < ApplicationController
  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    @commentable = @photo
    @comments = @commentable.comments
    @comment = Comment.new
    @album = Album.find(params[:album_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new
    @album = Album.find(params[:album_id])
    @commentable = @photo
    @comments = @commentable.comments
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])
    @album = Album.find(params[:album_id])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to [@album, @photo], notice: 'Photo was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to [@album, @photo], notice: 'Photo was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to album_url(@album) }
      format.json { head :no_content }
    end
  end
end
