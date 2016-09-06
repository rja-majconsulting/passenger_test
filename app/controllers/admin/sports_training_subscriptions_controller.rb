class Admin::SportsTrainingSubscriptionsController < AdminController
  helper Admin::SubscriptionHelper
  before_action :set_sports_training_subscription, only: [:show, :edit, :update, :destroy]
  before_action :init_model, only: [:new, :edit, :create, :update]

  # GET /sports_training_subscriptions
  # GET /sports_training_subscriptions.json
  def index
    @places = Place.all
    @activities = Activity.all
    @sports_trainings = Hash.new
    @sports_trainings_count = Hash.new
    @places.each do |place|
      trainings = SportsTraining.where(:place_id => place.id)
      if trainings and trainings.size>0
        countSubscriptions = 0
        trainings.each do |training|
          training.subscriptions = SportsTrainingSubscription.where(:sports_training_id => training.id)
          countSubscriptions += training.subscriptions.length
        end
        @sports_trainings[place.id] = trainings
        @sports_trainings_count[place.id] = countSubscriptions
      end
    end

  end

  # GET /sports_training_subscriptions/1
  # GET /sports_training_subscriptions/1.json
  def show
  end

  # GET /sports_training_subscriptions/new
  def new
    @sports_training_subscription = SportsTrainingSubscription.new
  end

  # GET /sports_training_subscriptions/1/edit
  def edit
  end

  # POST /sports_training_subscriptions
  # POST /sports_training_subscriptions.json
  def create
    @sports_training_subscription = SportsTrainingSubscription.new(sports_training_subscription_params)

    respond_to do |format|
      if @sports_training_subscription.save
        format.html { redirect_to admin_sports_training_subscriptions_path, notice: t('subscription_new_success_message') }
        format.json { render :show, status: :created, location: @sports_training_subscription }
      else
        format.html { render :new }
        format.json { render json: @sports_training_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports_training_subscriptions/1
  # PATCH/PUT /sports_training_subscriptions/1.json
  def update
    respond_to do |format|
      if @sports_training_subscription.update(sports_training_subscription_params)
        format.html { redirect_to admin_sports_training_subscriptions_path, notice: t('subscription_edit_success_message') }
        format.json { render :show, status: :ok, location: @sports_training_subscription }
      else
        format.html { render :edit }
        format.json { render json: @sports_training_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports_training_subscriptions/1
  # DELETE /sports_training_subscriptions/1.json
  def destroy
    @sports_training_subscription.destroy
    respond_to do |format|
      format.html { redirect_to admin_sports_training_subscriptions_url, notice: t('subscription_destroy_success_message') }
      format.json { head :no_content }
    end
  end

  def export
    @subscriptions = SportsTrainingSubscription.where(:sports_training_id => params[:id])
    @sports_training = SportsTraining.find_by(:id => params[:id])
    @subscriptionType = SportsTrainingSubscription.name
    @activities = Activity.all

    respond_to do |format|
      format.xlsx { render xlsx: 'subscriptions', template: 'admin/subscription/export', filename: @sports_training.place.city + "_" + l(@sports_training.startDate) + "_" + l(@sports_training.endDate) + ".xlsx" }
    end

  end

  def confirm
    subscription = SportsTrainingSubscription.find_by(:id => params[:id])
    SubscriptionMailer.sports_training_confirmation(subscription).deliver
    respond_to do |format|
      format.html { redirect_to admin_sports_training_subscriptions_url, notice: t('subscription_email_confirmation_message', email: subscription.email) }
      format.json { head :no_content }
    end
  end

  def update_activities
    sports_training = SportsTraining.find(params[:sports_training_id])
    @morning_activities = sports_training.morningActivities
    @afternoon_activities = sports_training.afternoonActivities
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sports_training_subscription
      @sports_training_subscription = SportsTrainingSubscription.find_by(:id => params[:id])
    end

    def init_model
      if @sports_training_subscription!=nil
        @sports_trainings = [SportsTraining.find_by(:id => @sports_training_subscription.sports_training_id)]
      else
        @sports_trainings = SportsTraining.all.order(:code)
      end

      @morningActivities = @sports_trainings.first.morningActivities
      @afternoonActivities = @sports_trainings.first.afternoonActivities
    end

      # Never trust parameters from the scary internet, only allow the white list through.
    def sports_training_subscription_params
      params.require(:sports_training_subscription).permit(:lastName, :firstName, :birthDate, :street, :city, :postalCode, :telefonNumber, :email, :sports_training_id, :activity_morning_id, :activity_afternoon_id)
    end
end
