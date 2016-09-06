class Admin::SportModulesController < AdminController
  before_action :set_sport_module, only: [:show, :edit, :update, :destroy]
  before_action :init_model, only: [:new, :edit, :create, :update]

  # GET /sport_modules
  # GET /sport_modules.json
  def index
    @sport_modules = SportModule.all
  end

  # GET /sport_modules/1
  # GET /sport_modules/1.json
  def show
  end

  # GET /sport_modules/new
  def new
    @sport_module = SportModule.new
  end

  # GET /sport_modules/1/edit
  def edit
    @places = Place.all
    @activities = Activity.all
    @coaches = Coach.all
  end

  # POST /sport_modules
  # POST /sport_modules.json
  def create
    @sport_module = SportModule.new(sport_module_params)

    respond_to do |format|
      if @sport_module.save
        format.html { redirect_to admin_sport_modules_path, notice: t('sport_module_new_success_message') }
        format.json { render :show, status: :created, location: @sport_module }
      else
        format.html { render :new }
        format.json { render json: @sport_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sport_modules/1
  # PATCH/PUT /sport_modules/1.json
  def update
    respond_to do |format|
      if @sport_module.update(sport_module_params)
        format.html { redirect_to admin_sport_modules_path, notice: t('sport_module_edit_success_message') }
        format.json { render :show, status: :ok, location: @sport_module }
      else
        format.html { render :edit }
        format.json { render json: @sport_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sport_modules/1
  # DELETE /sport_modules/1.json
  def destroy
    @sport_module.destroy
    respond_to do |format|
      format.html { redirect_to admin_sport_modules_url, notice: t('sport_module_destroy_success_message') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport_module
      @sport_module = SportModule.find_by(:id => params[:id])
    end

    def init_model
      @places = Place.all
      @activities = Activity.all
      @coaches = Coach.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sport_module_params
      params.require(:sport_module).permit(:code, :place_id, :activity, :coach_id, :day, :startTime, :endTime, :maxSubscriptions, :meetingPlace)
    end
end
