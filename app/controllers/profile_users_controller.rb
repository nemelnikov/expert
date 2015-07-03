class ProfileUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #To disable users to edit other user profiles
  skip_authorize_resource only: [:new,:create] # We still want to be able to create new users without any sort of authentication

  # GET /profile_users
  # GET /profile_users.json
  # Vishal - Disabled using routes
  def index
    @profile_users = ProfileUser.all
  end

  # GET /profile_users/1
  # GET /profile_users/1.json
  def show
  end

  #GET 
  def userQuestions
    #@userQuestion = Question.find_by_profile_user_id(:all,ProfileUser.find_by_user_id(current_user.id))
    @userQuestion = Question.where("profile_user_id = :userID",userID: ProfileUser.find_by_user_id(current_user.id))
  end

  # Vishal - Disabled using routes
  # GET /profile_users/new
  def new
    @profile_user = ProfileUser.new
  end

  # GET /profile_users/1/edit
  def edit
  end

  # Vishal - Disabled using routes
  # POST /profile_users
  # POST /profile_users.json
  def create
    @profile_user = ProfileUser.new(profile_user_params)

    respond_to do |format|
      if @profile_user.save
        format.html { redirect_to @profile_user, notice: 'Profile user was successfully created.' }
        format.json { render :show, status: :created, location: @profile_user }
      else
        format.html { render :new }
        format.json { render json: @profile_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_users/1
  # PATCH/PUT /profile_users/1.json
  def update
    respond_to do |format|
      if @profile_user.update(profile_user_params)
        format.html { redirect_to @profile_user, notice: 'Profile user was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_user }
      else
        format.html { render :edit }
        format.json { render json: @profile_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Vishal - Disabled using routes
  # DELETE /profile_users/1
  # DELETE /profile_users/1.json
  def destroy
    @profile_user.destroy
    respond_to do |format|
      format.html { redirect_to profile_users_url, notice: 'Profile user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_user
      @profile_user = ProfileUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_user_params
      params.require(:profile_user).permit(:first_name, :last_name, :skype)
    end
end
