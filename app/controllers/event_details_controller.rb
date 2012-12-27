class EventDetailsController < ApplicationController
  # GET /event_details
  # GET /event_details.json
  def index
    @event_details = EventDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_details }
    end
  end

  # GET /event_details/1
  # GET /event_details/1.json
  def show
    @event_detail = EventDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_detail }
    end
  end

  # GET /event_details/new
  # GET /event_details/new.json
  def new
    @event_detail = EventDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_detail }
    end
  end

  # GET /event_details/1/edit
  def edit
    @event_detail = EventDetail.find(params[:id])
  end

  # POST /event_details
  # POST /event_details.json
  def create
    @event_detail = EventDetail.new(params[:event_detail])

    respond_to do |format|
      if @event_detail.save
        format.html { redirect_to @event_detail, notice: 'Event detail was successfully created.' }
        format.json { render json: @event_detail, status: :created, location: @event_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_details/1
  # PUT /event_details/1.json
  def update
    @event_detail = EventDetail.find(params[:id])

    respond_to do |format|
      if @event_detail.update_attributes(params[:event_detail])
        format.html { redirect_to @event_detail, notice: 'Event detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_details/1
  # DELETE /event_details/1.json
  def destroy
    @event_detail = EventDetail.find(params[:id])
    @event_detail.destroy

    respond_to do |format|
      format.html { redirect_to event_details_url }
      format.json { head :no_content }
    end
  end
end
