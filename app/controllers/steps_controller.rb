class StepsController < ApplicationController
  before_filter :authenticate_user!

  # GET games/1/steps
  # GET games/1/steps.json
  def index
    find_game
    redirect_to game_url(@game)
  end

  # GET games/1/steps/1
  # GET games/1/steps/1.json
  def show
    find_game
    @step = Step.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @step }
    end
  end

  # GET games/1/steps/new
  # GET games/1/steps/new.json
  def new
    find_game
    @step = @game.steps.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @step }
    end
  end

  # POST games/1/steps
  # POST games/1/steps.json
  def create
    find_game
    @step = @game.steps.build(params[:step])
    @step.user = current_user
    @step.game_index = @game.steps.count + 1
    @step.save_image(params[:step][:image_data])

    respond_to do |format|
      if @step.save
        @game.complete = true if @game.steps.count >= 3
        @game.save

        format.html { redirect_to game_step_url(@game, @step), notice: 'Step was successfully created.' }
        format.json { render json: @step, status: :created, location: @step }
      else
        format.html { render action: "new" }
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
      format.html { redirect_to game_steps_url }
      format.json { head :no_content }
    end
  end

  protected
    def find_game
      @game = Game.find(params[:game_id])
    end
end
