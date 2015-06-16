class ProfileExpertsController < ApplicationController
  before_action :authenticate_ask_expert!, except: [:experts, :expert_info]
  before_action :set_profile_expert, only: [:show, :edit, :update, :destroy, :expert_info]

  # GET /profile_experts
  # GET /profile_experts.json
  def index
    @profile_experts = ProfileExpert.all
  end

  # GET /profile_experts/1
  # GET /profile_experts/1.json
  def show
  end

  # GET /profile_experts/new
  def new
    @profile_expert = ProfileExpert.new
  end

  # GET /profile_experts/1/edit
  def edit
  end

  # POST /profile_experts
  # POST /profile_experts.json
  def create
    @profile_expert = ProfileExpert.new(profile_expert_params)

    respond_to do |format|
      if @profile_expert.save
        format.html { redirect_to @profile_expert, notice: 'Profile expert was successfully created.' }
        format.json { render :show, status: :created, location: @profile_expert }
      else
        format.html { render :new }
        format.json { render json: @profile_expert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_experts/1
  # PATCH/PUT /profile_experts/1.json
  def update
    respond_to do |format|
      if @profile_expert.update(profile_expert_params)
        format.html { redirect_to @profile_expert, notice: 'Profile expert was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_expert }
      else
        format.html { render :edit }
        format.json { render json: @profile_expert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_experts/1
  # DELETE /profile_experts/1.json
  def destroy
    @profile_expert.destroy
    respond_to do |format|
      format.html { redirect_to profile_experts_url, notice: 'Profile expert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def experts #list of all experts. should be separated from this controller in the future
    @profile_experts = ProfileExpert.all
  end

  def expert_info #expert's page. should be separated from this controller in the future
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_expert
      @profile_expert = ProfileExpert.find(params[:id])
      @expert_genres = @profile_expert.genres.pluck(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_expert_params
      params.require(:profile_expert).permit(:first_name, :last_name, :skype, :about, :free_questions , { :genre_ids => [] })
    end
end
