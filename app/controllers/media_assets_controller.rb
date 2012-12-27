class MediaAssetsController < ApplicationController
  # GET /media_assets
  # GET /media_assets.json
  def index
    @media_assets = MediaAsset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media_assets }
    end
  end

  # GET /media_assets/1
  # GET /media_assets/1.json
  def show
    @media_asset = MediaAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media_asset }
    end
  end

  # GET /media_assets/new
  # GET /media_assets/new.json
  def new
    @media_asset = MediaAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media_asset }
    end
  end

  # GET /media_assets/1/edit
  def edit
    @media_asset = MediaAsset.find(params[:id])
  end

  # POST /media_assets
  # POST /media_assets.json
  def create
    @media_asset = MediaAsset.new(params[:media_asset])

    respond_to do |format|
      if @media_asset.save
        format.html { redirect_to @media_asset, notice: 'Media asset was successfully created.' }
        format.json { render json: @media_asset, status: :created, location: @media_asset }
      else
        format.html { render action: "new" }
        format.json { render json: @media_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media_assets/1
  # PUT /media_assets/1.json
  def update
    @media_asset = MediaAsset.find(params[:id])

    respond_to do |format|
      if @media_asset.update_attributes(params[:media_asset])
        format.html { redirect_to @media_asset, notice: 'Media asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @media_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_assets/1
  # DELETE /media_assets/1.json
  def destroy
    @media_asset = MediaAsset.find(params[:id])
    @media_asset.destroy

    respond_to do |format|
      format.html { redirect_to media_assets_url }
      format.json { head :no_content }
    end
  end
end
