class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @room = Room.find(params[:room_id])
    @questions = @room.questions.sorted_created_at_desc
    respond_to do |format|
      format.html # index.html.erb
      format.js   { render action: "refresh.js.erb" }
    end
  end

  # GET /questions
  # GET /questions.json
  def commentary
    @room = Room.find(params[:room_id])
    if params[:last_time]
      @questions = @room.questions.newest( params[:last_time] )
    else
      @questions = [@room.questions.sorted_created_at_desc.first]
    end
    respond_to do |format|
      format.html # commentary.html.erb
      format.js   { render action: "commentary.js.erb" }
    end
  end

  # # GET /questions/1
  # # GET /questions/1.json
  # def show
  #   # @question = Question.find(params[:id])

  #   # respond_to do |format|
  #   #   format.html # show.html.erb
  #   #   format.json { render json: @question }
  #   # end
  # end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @room = Room.find(params[:room_id])
    @questions = @room.questions.sorted_created_at_desc
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # # GET /questions/1/edit
  # def edit
  #   # @question = Question.find(params[:id])
  # end

  # POST /questions
  # POST /questions.json
  def create
    @room = Room.find(params[:room_id])
    respond_to do |format|
      @room.questions.create( params[:question] )
      @question = Question.new
      @questions = @room.questions.sorted_created_at_desc
      format.js { render action: "create.js.erb" }
    end
  end

  # # PUT /questions/1
  # # PUT /questions/1.json
  # def update
  #   # @question = Question.find(params[:id])

  #   # respond_to do |format|
  #   #   if @question.update_attributes(params[:question])
  #   #     format.html { redirect_to @question, notice: 'Question was successfully updated.' }
  #   #     format.json { head :no_content }
  #   #   else
  #   #     format.html { render action: "edit" }
  #   #     format.json { render json: @question.errors, status: :unprocessable_entity }
  #   #   end
  #   # end
  # end

  # # DELETE /questions/1
  # # DELETE /questions/1.json
  # def destroy
  #   # @question = Question.find(params[:id])
  #   # @question.destroy

  #   # respond_to do |format|
  #   #   format.html { redirect_to questions_url }
  #   #   format.json { head :no_content }
  #   # end
  # end
end
