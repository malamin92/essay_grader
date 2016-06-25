class EssaysController < ApplicationController
  before_action :authenticate_user!
  # GET /essays
  # GET /essays.json
  def index
    if current_user.admin
      @essays = Essay.is_not_graded
    else
      @essays = current_user.essays.all
    end
  end

  # GET /essays/1
  # GET /essays/1.json
  def show
    @essay = Essay.find(params[:id])
  end

  # GET /essays/new
  def new
    @essay = Essay.new
  end

  # GET /essays/1/edit
  def edit
  end

  # POST /essays
  # POST /essays.json
  def create
    @essay = Essay.new(essay_params)
    @essay.user_id = current_user.id
    @essay.gradded = false

    respond_to do |format|
      if @essay.save
        EssaySubmissionMailer.essay_submitted_email(current_user, @essay).deliver_now
        format.html { redirect_to @essay, notice: 'Essay was successfully created, you will receive an e-mail once the essay has been graded!' }
        format.json { render :show, status: :created, location: @essay }
      else
        format.html { render :new }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /essays/1
  # PATCH/PUT /essays/1.json
  def update
    respond_to do |format|
      if @essay.update(essay_params)
        format.html { redirect_to @essay, notice: 'Essay was successfully updated.' }
        format.json { render :show, status: :ok, location: @essay }
      else
        format.html { render :edit }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /essays/1
  # DELETE /essays/1.json
  def destroy
    @essay.destroy
    respond_to do |format|
      format.html { redirect_to essays_url, notice: 'Essay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def essay_params
      params.require(:essay).permit(:body)
    end
end
