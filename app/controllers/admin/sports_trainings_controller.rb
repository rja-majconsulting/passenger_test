class Admin::SportsTrainingsController < AdminController
  before_action :set_sports_training, only: [:show, :edit, :update, :destroy]
  before_action :prepare_activities, only: [:create, :update]
  before_action :init_model, only: [:new, :edit, :create, :update]

  # GET /sports_trainings
  # GET /sports_trainings.json
  def index
    @sports_trainings = SportsTraining.all
  end

  # GET /sports_trainings/1
  # GET /sports_trainings/1.json
  def show
  end

  # GET /sports_trainings/new
  def new
    @sports_training = SportsTraining.new
  end

  # GET /sports_trainings/1/edit
  def edit
  end

  # POST /sports_trainings
  # POST /sports_trainings.json
  def create
    @sports_training = SportsTraining.new(sports_training_params)
    respond_to do |format|
      if @sports_training.save
        format.html { redirect_to admin_sports_trainings_path, notice: t('sports_training_new_success_message') }
        format.json { render :show, status: :created, location: @sports_training }
      else
        format.html { render :new }
        format.json { render json: @sports_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports_trainings/1
  # PATCH/PUT /sports_trainings/1.json
  def update
    respond_to do |format|
      if @sports_training.update(sports_training_params)
        format.html { redirect_to admin_sports_trainings_path, notice: t('sports_training_edit_success_message') }
        format.json { render :show, status: :ok, location: @sports_training }
      else
        format.html { render :edit }
        format.json { render json: @sports_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports_trainings/1
  # DELETE /sports_trainings/1.json
  def destroy
    @sports_training.destroy
    respond_to do |format|
      format.html { redirect_to admin_sports_trainings_url, notice: t('sports_training_destroy_success_message') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sports_training
      @sports_training = SportsTraining.find_by(:id => params[:id])
    end

  def init_model
    @places = Place.all
    @activities = Activity.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sports_training_params
      params.require(:sports_training).permit!#(:code, :place_id, :startDate, :endDate, :startTime, :endTime, :halfDayPrice, :fullDayPrice, :morningNursery, :afternoonNursery, :morningActivities => [],  :afternoonActivities => [])
    end

    def prepare_activities
      #Remove the first empty element of arrays (bug from multiple select)
      params[:sports_training][:morningActivities] = params[:sports_training][:morningActivities].drop(1)
      params[:sports_training][:afternoonActivities] = params[:sports_training][:afternoonActivities].drop(1)
      params[:sports_training][:morningActivities] = Activity.find(sports_training_params[:morningActivities])
      params[:sports_training][:afternoonActivities] = Activity.find(sports_training_params[:afternoonActivities])
    end
end
