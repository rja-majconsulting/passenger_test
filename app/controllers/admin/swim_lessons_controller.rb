class Admin::SwimLessonsController < AdminController
  before_action :set_swim_lesson, only: [:show, :edit, :update, :destroy]
  before_action :init_model, only: [:new, :edit, :create, :update]

  # GET /swim_lessons
  # GET /swim_lessons.json
  def index
    @swim_lessons = SwimLesson.all
  end

  # GET /swim_lessons/1
  # GET /swim_lessons/1.json
  def show
  end

  # GET /swim_lessons/new
  def new
    @swim_lesson = SwimLesson.new
  end

  # GET /swim_lessons/1/edit
  def edit
  end

  # POST /swim_lessons
  # POST /swim_lessons.json
  def create
    @swim_lesson = SwimLesson.new(swim_lesson_params)

    respond_to do |format|
      if @swim_lesson.save
        format.html { redirect_to admin_swim_lessons_path, notice: t('swim_lesson_new_success_message') }
        format.json { render :show, status: :created, location: @swim_lesson }
      else
        format.html { render :new }
        format.json { render json: @swim_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swim_lessons/1
  # PATCH/PUT /swim_lessons/1.json
  def update
    respond_to do |format|
      if @swim_lesson.update(swim_lesson_params)
        format.html { redirect_to admin_swim_lessons_path, notice: t('swim_lesson_edit_success_message') }
        format.json { render :show, status: :ok, location: @swim_lesson }
      else
        format.html { render :edit }
        format.json { render json: @swim_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swim_lessons/1
  # DELETE /swim_lessons/1.json
  def destroy
    @swim_lesson.destroy
    respond_to do |format|
      format.html { redirect_to admin_swim_lessons_url, notice: t('swim_lesson_destroy_success_message') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swim_lesson
      @swim_lesson = SwimLesson.find_by(:id => params[:id])
    end

    def init_model
      @places = Place.all
      @levels = Level.all
      @coaches = Coach.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swim_lesson_params
      params.require(:swim_lesson).permit(:code, :place_id, :level_id, :coach_id, :day, :startTime, :endTime, :maxSubscriptions, :category)
    end
end
