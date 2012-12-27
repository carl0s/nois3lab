class JobPositionsController < ApplicationController
  # GET /job_positions
  # GET /job_positions.json
  def index
    @job_positions = JobPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_positions }
    end
  end

  # GET /job_positions/1
  # GET /job_positions/1.json
  def show
    @job_position = JobPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_position }
    end
  end

  # GET /job_positions/new
  # GET /job_positions/new.json
  def new
    @job_position = JobPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_position }
    end
  end

  # GET /job_positions/1/edit
  def edit
    @job_position = JobPosition.find(params[:id])
  end

  # POST /job_positions
  # POST /job_positions.json
  def create
    @job_position = JobPosition.new(params[:job_position])

    respond_to do |format|
      if @job_position.save
        format.html { redirect_to @job_position, notice: 'Job position was successfully created.' }
        format.json { render json: @job_position, status: :created, location: @job_position }
      else
        format.html { render action: "new" }
        format.json { render json: @job_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_positions/1
  # PUT /job_positions/1.json
  def update
    @job_position = JobPosition.find(params[:id])

    respond_to do |format|
      if @job_position.update_attributes(params[:job_position])
        format.html { redirect_to @job_position, notice: 'Job position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_positions/1
  # DELETE /job_positions/1.json
  def destroy
    @job_position = JobPosition.find(params[:id])
    @job_position.destroy

    respond_to do |format|
      format.html { redirect_to job_positions_url }
      format.json { head :no_content }
    end
  end
end
