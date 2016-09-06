class Admin::SwimLessonSubscriptionsController < AdminController
  helper Admin::SubscriptionHelper
  before_action :set_swim_lesson_subscription, only: [:show, :edit, :update, :destroy]
  before_action :init_model, only: [:new, :edit, :create, :update]

  # GET /swim_lesson_subscriptions
  # GET /swim_lesson_subscriptions.json
  def index
    @swim_lesson_waiting_payment = SwimLessonSubscription.waiting_payment
    @swim_lesson_waiting_availability = SwimLessonSubscription.waiting_availability
    @swim_lesson_unrenewed = SwimLessonSubscription.not_renewed
    @swim_lessons = Hash.new
    @swim_lessons_count = Hash.new
    @swim_lessons_categories=SwimLesson.uniq.pluck(:category)
    @swim_lessons_categories.each do |swim_lesson_category|
      lessons = SwimLesson.paid_pending_by_category(swim_lesson_category,true)
      countSubscriptions =SwimLessonSubscription.includes(:swim_lesson).where('paid=? and dueDate>=? and swim_lessons.category=?',true,Date.today,swim_lesson_category).references(:swim_lesson).group(:swim_lesson_id).count.values.sum
      @swim_lessons[swim_lesson_category] = lessons
      @swim_lessons_count[swim_lesson_category] = countSubscriptions
    end




  end

  # GET /swim_lesson_subscriptions/1
  # GET /swim_lesson_subscriptions/1.json
  def show
  end

  # GET /swim_lesson_subscriptions/new
  def new
    @swim_lesson_subscription = SwimLessonSubscription.new
  end

  # GET /swim_lesson_subscriptions/1/edit
  def edit
  end

  # POST /swim_lesson_subscriptions
  # POST /swim_lesson_subscriptions.json
  def create
    @swim_lesson_subscription = SwimLessonSubscription.new(swim_lesson_subscription_params)

    respond_to do |format|
      if @swim_lesson_subscription.save
        format.html { redirect_to admin_swim_lesson_subscriptions_path, notice: t('subscription_new_success_message') }
        format.json { render :show, status: :created, location: @swim_lesson_subscription }
      else
        format.html { render :new }
        format.json { render json: @swim_lesson_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swim_lesson_subscriptions/1
  # PATCH/PUT /swim_lesson_subscriptions/1.json
  def update
    respond_to do |format|
      if @swim_lesson_subscription.update(swim_lesson_subscription_params)
        format.html { redirect_to admin_swim_lesson_subscriptions_path, notice: t('subscription_edit_success_message') }
        format.json { render :show, status: :ok, location: @swim_lesson_subscription }
      else
        format.html { render :edit }
        format.json { render json: @swim_lesson_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swim_lesson_subscriptions/1
  # DELETE /swim_lesson_subscriptions/1.json
  def destroy
    @swim_lesson_subscription.destroy
    respond_to do |format|
      format.html { redirect_to admin_swim_lesson_subscriptions_url, notice: t('subscription_destroy_success_message') }
      format.json { head :no_content }
    end
  end

  def export
    @subscriptions = SwimLessonSubscription.where('dueDate >= ? AND swim_lesson_id = ?',Date.today,params[:id])
    @swim_lesson = SwimLesson.find_by(:id => params[:id])
    @subscriptionType = SwimLessonSubscription.name

    respond_to do |format|
      format.xlsx { render xlsx: 'subscriptions', template: 'admin/subscription/export', filename: @swim_lesson.code + ".xlsx" }
    end

  end

  def confirm
    subscription = SwimLessonSubscription.find_by(:id => params[:id])
    SubscriptionMailer.swim_lesson_confirmation(subscription).deliver
    respond_to do |format|
      format.html { redirect_to admin_swim_lesson_subscriptions_url, notice: t('subscription_email_confirmation_message', email: subscription.email) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swim_lesson_subscription
      @swim_lesson_subscription = SwimLessonSubscription.find_by(:id => params[:id])
    end

    def init_model
      @swim_lessons=SwimLesson.all.order(:code)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swim_lesson_subscription_params
      params.require(:swim_lesson_subscription).permit(:lastName, :firstName, :birthDate, :street, :city, :postalCode, :telefonNumber, :email, :swim_lesson_id, :dueDate)
    end
end
