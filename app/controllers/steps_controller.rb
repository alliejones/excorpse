class StepsController < ApplicationController
  # GET games/1/steps
  # GET games/1/steps.json
  def index
    find_parent
    @steps = Step.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @steps }
    end
  end

  # GET games/1/steps/1
  # GET games/1/steps/1.json
  def show
    find_parent
    @step = Step.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @step }
    end
  end

  # GET games/1/steps/new
  # GET games/1/steps/new.json
  def new
    find_parent
    @step = Step.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @step }
    end
  end

  # GET games/1/steps/1/edit
  def edit
    find_parent
    @step = Step.find(params[:id])
  end

  # POST games/1/steps
  # POST games/1/steps.json
  def create
    find_parent
    @step = Step.new(params[:step])

    respond_to do |format|
      if @step.save
        format.html { redirect_to @step, notice: 'Step was successfully created.' }
        format.json { render json: @step, status: :created, location: @step }
      else
        format.html { render action: "new" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT games/1/steps/1
  # PUT games/1/steps/1.json
  def update
    @step = Step.find(params[:id])

    respond_to do |format|
      if @step.update_attributes(params[:step])
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE games/1/steps/1
  # DELETE games/1/steps/1.json
  def destroy
    @step = Step.find(params[:id])
    @step.destroy

    respond_to do |format|
      format.html { redirect_to steps_url }
      format.json { head :no_content }
    end
  end

  protected
    def find_parent
      @game = Game.find(params[:game_id])
    end
end
