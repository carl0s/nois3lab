class WorksController < ApplicationController
  autocomplete :tag, :name
  autocomplete :skill, :name
  # GET /works
  # GET /works.json

  def update_all
    client.user_projects('emanuelemacri').each do |t|
      @work.title = t.post.title
      @work.save!
    end
  end

  def index
    @works = Work.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @works }
    end
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @work = Work.find(params[:id])
    @tags = @work.tags
    @client_id = @work.client_id
    @client = Client.find(@client_id)
    @teammate_id = @work.teammate_id
    @teammate = Teammate.find(@teammate_id)
    @media_id = @work.media_id
    @media_asset = MediaAsset.find(@media_id)
    @service_id = @work.service_id
    @service = Service.find(@service_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {:work => @work, :client => @client, :teammate => @teammate, :media_asset => @media_asset, :service => @service } }
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    @work = Work.new

    logger.info @work.be.user_projects('nois3lab')

    @tags = Tag.all
    @media_asset = MediaAsset.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work }
    end
  end

  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
    @tags = Tag.all
    @media_asset = MediaAsset.all
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(params[:work])
    @media_asset = MediaAsset.all

    if params.include? 'tags'
      params['tags'].each do |name|
        next if name.empty?
        tag = Tag.new
        tag.name = name
        tag.work_id = @work.id
        tag.save!
      end
    end


    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render json: @work, status: :created, location: @work }
      else
        format.html { render action: "new" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.json
  def update
    @work = Work.find(params[:id])
    @media_asset = MediaAsset.all
    # tag = Tag.new
    # tag.work_id = params[:id]
    # tag.name = params[:tag]

    if params.include? 'tags'
      tag = Tag.new
      tag.name = params[:tags]
      tag.work_id = @work.id
      tag.save!
    end

    @work.media_id = params[:media_value]
    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end

  def sync
    @works = Work.all

    @works.each do |k|
      k.be.user_projects("arsthanea").each do |t|

        # if(k.updated_at.to_i < t['modified_on'])
          @be_work = Work.new
          @be_work.name = t['name']
          @be_work.year = Date.today.year
          @be_work.content = t['content']
          @be_work.service_id = '1'
          @be_work.teammate_id = '1'
          @be_work.client_id = '1'
          @be_work.save!
        # else
        #   next
        # end
      end

    end

    redirect_to action: "index"
  end


end
