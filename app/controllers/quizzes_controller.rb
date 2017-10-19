class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
    #@questions = Question.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  def show
  end

  # GET /quizzes/1/edit
  def edit
  end
  def submit
        @score = 0
        @quiz= Quiz.find(params[:id])
        puts (allquestions @quiz.subgenre_id).length
        for i in 0..(allquestions @quiz.subgenre_id).length-1
            @correct= true
            if allquestions(@quiz.subgenre_id)[i].correct1
                if params[:arr][allquestions(@quiz.subgenre_id)[i].id.to_s]['1'].to_i == 0
                    @correct= false
                end
            end
            unless allquestions(@quiz.subgenre_id)[i].correct1
                if params[:arr][allquestions(@quiz.subgenre_id)[i].id.to_s]['1'].to_i == 1
                    @correct= false
                end
            end
            if allquestions(@quiz.subgenre_id)[i].correct2
                if params[:arr][allquestions(@quiz.subgenre_id)[i].id.to_s]['2'].to_i == 0
                    @correct= false
                end
            end
            unless allquestions(@quiz.subgenre_id)[i].correct2
                if params[:arr][allquestions(@quiz.subgenre_id)[i].id.to_s]['2'].to_i == 1
                    @correct= false
                end
            end
            if allquestions(@quiz.subgenre_id)[i].correct3
                if params[:arr][allquestions(@quiz.subgenre_id)[i].id.to_s]['3'].to_i == 0
                    @correct= false
                end
            end
            unless allquestions(@quiz.subgenre_id)[i].correct3
                if params[:arr][allquestions(@quiz.subgenre_id)[i].id.to_s]['3'].to_i == 1
                    @correct= false
                end
            end
            if allquestions(@quiz.subgenre_id)[i].correct4
                if params[:arr][allquestions(@quiz.subgenre_id)[i].id.to_s]['4'].to_i == 0
                    @correct= false
                end
            end
            unless allquestions(@quiz.subgenre_id)[i].correct4
                if params[:arr][allquestions(@quiz.subgenre_id)[i].id.to_s]['4'].to_i == 1
                    @correct= false
                end
            end
            if @correct
                @score = @score + 10
                puts "Hello"
            end


    end
end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:name, :subgenre_id)
    end
end
