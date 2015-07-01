class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @messages=@question.messages#Messages of the assoisated questions
    
    if @messages.count.even?#Check if the current reply can be made by the user or the expert
      expertChance=true;
    else
      expertChance=false;
    end

    if ask_expert_signed_in?#Check who is logged in , user or expert?
      expertLogin =true
    else
      expertLogin =false
    end

    if expertLogin && expertChance
      @canReply = true
    elsif !expertLogin && !expertChance
      @canReply = true
    else
      @canReply = false
    end
      

  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    userid= ProfileUser.find_by_user_id(current_user.id)#Get the profile_user of the current user
    #logger.info "yep" +@userid.to_s#For checking
    @question.profile_user_id = userid.id #Set question id to profile user id
    

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :question_description, :profile_expert_id, :question_type, :genre_id)
    end

    
end
