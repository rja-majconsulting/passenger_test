class Admin::SportModuleSubscriptionsController < AdminController
  helper Admin::SubscriptionHelper
  before_action :set_sport_module_subscription, only: [:show, :edit, :update, :destroy]
  before_action :init_model, only: [:new, :edit, :create, :update]

  # GET /sport_module_subscriptions
  # GET /sport_module_subscriptions.json
  def index
    @sport_module_waiting_payment = SportModuleSubscription.waiting_payment
    @sport_module_unrenewed = SportModuleSubscription.not_renewed
    @sport_modules=SportModule.with_paid_pending(true)
  end

  # GET /sport_module_subscriptions/1
  # GET /sport_module_subscriptions/1.json
  def show
  end

  # GET /sport_module_subscriptions/new
  def new
    @sport_module_subscription = SportModuleSubscription.new
  end

  # GET /sport_module_subscriptions/1/edit
  def edit
  end

  # POST /sport_module_subscriptions
  # POST /sport_module_subscriptions.json
  def create
    @sport_module_subscription = SportModuleSubscription.new(sport_module_subscription_params)

    respond_to do |format|
      if @sport_module_subscription.save
        format.html { redirect_to admin_sport_module_subscriptions_path, notice: t('subscription_new_success_message') }
        format.json { render :show, status: :created, location: @sport_module_subscription }
      else
        format.html { render :new }
        format.json { render json: @sport_module_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sport_module_subscriptions/1
  # PATCH/PUT /sport_module_subscriptions/1.json
  def update
    respond_to do |format|
      if @sport_module_subscription.update(sport_module_subscription_params)
        format.html { redirect_to admin_sport_module_subscriptions_path, notice: t('subscription_edit_success_message') }
        format.json { render :show, status: :ok, location: @sport_module_subscription }
      else
        format.html { render :edit }
        format.json { render json: @sport_module_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sport_module_subscriptions/1
  # DELETE /sport_module_subscriptions/1.json
  def destroy
    @sport_module_subscription.destroy
    respond_to do |format|
      format.html { redirect_to admin_sport_module_subscriptions_url, notice: t('subscription_destroy_success_message') }
      format.json { head :no_content }
    end
  end

  def export
    @subscriptions = SportModuleSubscription.where('"dueDate" >= ? AND sport_module_id = ?',Date.today,params[:id])
    @sport_module = SportModule.find_by(:id => params[:id])
    @subscriptionType = SportModuleSubscription.name

    respond_to do |format|
      format.xlsx { render xlsx: 'subscriptions', template: 'admin/subscription/export', filename: @sport_module.code + ".xlsx" }
    end

  end

  def confirm
    subscription = SportModuleSubscription.find_by(:id => params[:id])
    SubscriptionMailer.sport_module_confirmation(subscription).deliver
    respond_to do |format|
      format.html { redirect_to admin_sport_module_subscriptions_url, notice: t('subscription_email_confirmation_message', email: subscription.email) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport_module_subscription
      @sport_module_subscription = SportModuleSubscription.find_by(:id => params[:id])
    end

    def init_model
      @sport_modules = SportModule.all.order(:code)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sport_module_subscription_params
      params.require(:sport_module_subscription).permit(:lastName, :firstName, :birthDate, :street, :city, :postalCode, :telefonNumber, :email, :dueDate, :sport_module_id)
    end
end
