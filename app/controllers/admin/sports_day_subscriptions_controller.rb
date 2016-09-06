class Admin::SportsDaySubscriptionsController < AdminController
  helper Admin::SubscriptionHelper
  before_action :set_sports_day_subscription, only: [:show, :edit, :update, :destroy]
  before_action :init_model, only: [:new, :edit, :create, :update]

  # GET /sports_day_subscriptions
  # GET /sports_day_subscriptions.json
  def index
    @places = Place.all
    @sports_days = Hash.new
    @sports_days_count = Hash.new
    @places.each do |place|
      days = SportsDay.where(:place_id => place.id)
      if days and days.size>0
        countSubscriptions = 0
        days.each do |day|
          day.subscriptions = SportsDaySubscription.where(:sports_day_id => day.id)
          countSubscriptions += day.subscriptions.length
        end
        @sports_days[place.id] = days
        @sports_days_count[place.id] = countSubscriptions
      end
    end
  end

  # GET /sports_day_subscriptions/1
  # GET /sports_day_subscriptions/1.json
  def show
  end

  # GET /sports_day_subscriptions/new
  def new
    @sports_day_subscription = SportsDaySubscription.new
  end

  # GET /sports_day_subscriptions/1/edit
  def edit
  end

  # POST /sports_day_subscriptions
  # POST /sports_day_subscriptions.json
  def create
    @sports_day_subscription = SportsDaySubscription.new(sports_day_subscription_params)

    respond_to do |format|
      if @sports_day_subscription.save
        format.html { redirect_to admin_sports_day_subscriptions_path, notice: t('subscription_new_success_message') }
        format.json { render :show, status: :created, location: @sports_day_subscription }
      else
        format.html { render :new }
        format.json { render json: @sports_day_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports_day_subscriptions/1
  # PATCH/PUT /sports_day_subscriptions/1.json
  def update
    respond_to do |format|
      if @sports_day_subscription.update(sports_day_subscription_params)
        format.html { redirect_to admin_sports_day_subscriptions_path, notice: t('subscription_edit_success_message') }
        format.json { render :show, status: :ok, location: @sports_day_subscription }
      else
        format.html { render :edit }
        format.json { render json: @sports_day_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports_day_subscriptions/1
  # DELETE /sports_day_subscriptions/1.json
  def destroy
    @sports_day_subscription.destroy
    respond_to do |format|
      format.html { redirect_to admin_sports_day_subscriptions_url, notice: t('subscription_destroy_success_message') }
      format.json { head :no_content }
    end
  end

  def export
    @subscriptions = SportsDaySubscription.where(:sports_day_id => params[:id])
    @sports_day = SportsDay.find_by(:id => params[:id])
    @subscriptionType = SportsDaySubscription.name

    respond_to do |format|
      format.xlsx { render xlsx: 'subscriptions', template: 'admin/subscription/export', filename: @sports_day.code + ".xlsx" }
    end

  end

  def confirm
    subscription = SportsDaySubscription.find_by(:id => params[:id])
    SubscriptionMailer.sports_day_confirmation(subscription).deliver
    respond_to do |format|
      format.html { redirect_to admin_sports_day_subscriptions_url, notice: t('subscription_email_confirmation_message', email: subscription.email) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sports_day_subscription
      @sports_day_subscription = SportsDaySubscription.find_by(:id => params[:id])
    end

    def init_model
      @sports_days = SportsDay.all.order(:code)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sports_day_subscription_params
      params.require(:sports_day_subscription).permit(:lastName, :firstName, :birthDate, :street, :city, :postalCode, :telefonNumber, :email, :sports_day_id)
    end
end
