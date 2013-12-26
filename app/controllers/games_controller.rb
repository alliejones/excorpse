class GamesController < ApplicationController
  before_filter :authenticate_user!

  # GET /games
  # GET /games.json
  def index
    @games = Game.where(:complete => true).all

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @games }
    end
  end

  def continue
    @game = User.where('id != ?', current_user.id).all.games.where(:complete => 0).first

    if @game
      redirect_to new_game_step_path(@game)
    else
      redirect_to home, notice: "Sorry, you've participated in all of the current games. You should start a new one instead!"
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    if @game.complete
      @game.create_image unless @game.image?

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @game }
      end
    else
      redirect_to new_game_step_path(@game)
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new
    @game.save
    redirect_to new_game_step_path(@game)
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:Game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
