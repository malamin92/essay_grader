class GradesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    @essay = Essay.find(params[:essay_id])
    @grade = Grade.find(params[:id])
  end

  # GET /grades/new
  def new
    @essay = Essay.find(params[:essay_id])
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @essay = Essay.find(params[:essay_id])
    @essay.gradded = true
    @grade = Grade.new(grade_params)
    @grade.essay_id = @essay.id


    respond_to do |format|
      if @grade.save && @essay.save
        format.html { redirect_to essay_grade_path(@essay, @grade), notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:comments, :grader, :grade)
    end
end
