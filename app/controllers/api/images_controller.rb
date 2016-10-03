module Api
  class ImagesController < ApiBaseController
    before_action :set_image, only: [:show, :update, :destroy]
    before_action :set_album, only: [:create, :index, :show]

    # GET /images
    def index
      @images = @album.images

      render json: @images
    end

    # GET /images/1
    def show
      render json: @image
    end

    # POST /images
    def create
      @image = @album.images.build(image_params)
      @image.user_id = @current_api_user.id

      if @image.save
        render json: @image, status: :created, location: @image
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /images/1
    def update
      if @image.update(image_params)
        render json: @image
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    # DELETE /images/1
    def destroy
      @image.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:album_id, :img, :user_id)
    end

    def set_album
      @album = Album.find(params[:album_id])
    end

  end
end