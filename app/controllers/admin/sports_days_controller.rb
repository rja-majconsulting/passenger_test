class Admin::SportsDaysController < AdminController
  before_action :set_sports_day, only: [:show, :edit, :update, :destroy]
  before_action :init_model, only: [:new, :edit, :create, :update]

  # GET /sports_days
  # GET /sports_days.json
  def index
    @sports_days = SportsDay.all
  end

  # GET /sports_days/1
  # GET /sports_days/1.json
  def show
  end

  # GET /sports_days/new
  def new
    @sports_day = SportsDay.new
  end

  # GET /sports_days/1/edit
  def edit
  end

  # POST /sports_days
  # POST /sports_days.json
  def create
    @sports_day = SportsDay.new(sports_day_params)

    respond_to do |format|
      if @sports_day.save
        format.html { redirect_to admin_sports_days_path, notice: t('sport_day_new_success_message') }
        format.json { render :show, status: :created, location: @sports_day }
      else
        format.html { render :new }
        format.json { render json: @sports_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports_days/1
  # PATCH/PUT /sports_days/1.json
  def update
    respond_to do |format|
      if @sports_day.update(sports_day_params)
        format.html { redirect_to admin_sports_days_path, notice: t('sport_day_edit_success_message') }
        format.json { render :show, status: :ok, location: @sports_day }
      else
        format.html { render :edit }
        format.json { render json: @sports_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports_days/1
  # DELETE /sports_days/1.json
  def destroy
    @sports_day.destroy
    respond_to do |format|
      format.html { redirect_to admin_sports_days_url, notice: t('sport_day_destroy_success_message') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sports_day
      @sports_day = SportsDay.find_by(:id => params[:id])
    end

    def init_model
      @places = Place.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sports_day_params
      params.require(:sports_day).permit(:code, :place_id, :date, :price, :startTime, :endTime, :morningPlace, :afternoonPlace, :paymentDate)
    end
end
