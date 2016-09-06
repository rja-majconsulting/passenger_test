class Public::RegistrationController < PublicController
  def index
    @subscription = Subscription.new
  end

  def update_sports_training_places
    ids = SportsTraining.uniq.pluck(:place_id)
    @sports_training_places = Place.find(ids)
    respond_to do |format|
      format.js
    end
  end

  def update_swim_lesson_places
    ids = SwimLesson.uniq.pluck(:place_id)
    @swim_lesson_places = Place.find(ids)
    respond_to do |format|
      format.js
    end
  end

  def update_swim_lesson_levels
    ids = SwimLesson.where(:place_id => params[:place_id]).uniq.pluck(:level_id)
    @swim_lesson_levels = Level.find(ids)
        respond_to do |format|
      format.js
    end

  end

  def update_sport_module_places
    ids = SportModule.uniq.pluck(:place_id)
    @sport_module_places = Place.find(ids)
    respond_to do |format|
      format.js
    end
  end

  def update_sports_day_places
    ids = SportsDay.uniq.pluck(:place_id)
    @sports_day_places = Place.find(ids)
    respond_to do |format|
      format.js
    end
  end

  def update_swim_lesson_choices
    @swim_lessons = SwimLesson.where(:place_id => params[:place_id], :level_id => params[:level_id]).order(:day,:startTime)
    respond_to do |format|
      format.js
    end
  end

  def update_sport_module_choices
    @sport_modules = SportModule.where(:place_id => params[:place_id]).order(:day)
    respond_to do |format|
      format.js
    end
  end

  def update_sports_day_choices
    @sports_days = SportsDay.where(:place_id => params[:place_id]).order(:date)
    respond_to do |format|
      format.js
    end
  end

  def update_sports_training_choices
    @sports_trainings = SportsTraining.find_by_place_id(params[:place_id])
    respond_to do |format|
      format.js
    end
  end

  def update_sports_training_activities
    sports_training = SportsTraining.find(params[:sports_training_id])
    @morning_activities = sports_training.morningActivities
    @afternoon_activities = sports_training.afternoonActivities
    respond_to do |format|
      format.js
    end

  end


  def confirm
    case params[:subscription][:type]
      when SportModuleSubscription.name
        @subscription = SportModuleSubscription.new(registration_params)
        save = @subscription.save
        if (save)
          SubscriptionMailer.sport_module_confirmation(@subscription).deliver
        end

      when SportsDaySubscription.name
        @subscription = SportsDaySubscription.new(registration_params)
        save = @subscription.save
        if save
          SubscriptionMailer.sports_day_confirmation(@subscription).deliver
        end

      when SportsTrainingSubscription.name
        @subscription = SportsTrainingSubscription.new(registration_params)
        save = @subscription.save
        if save
          SubscriptionMailer.sports_training_confirmation(@subscription).deliver
        end

      when SwimLessonSubscription.name
        @subscription = SwimLessonSubscription.new(registration_params)
        save = @subscription.save
        if save
          SubscriptionMailer.swim_lesson_confirmation(@subscription).deliver
        end

      when 'AdultSwimLessonSubscription'
        SubscriptionMailer.adult_swim_lesson_confirmation(params[:subscription]).deliver
        save = true

      when 'BirthDaySubscription'
        SubscriptionMailer.birthday_confirmation(params[:subscription]).deliver
        save = true
    end


    respond_to do |format|
      if save
        format.html { redirect_to public_root_path, notice: t('public_subscription_new_success_message', email: params[:subscription][:email]).html_safe }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :index }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end



  end

  private
    def registration_params
      params.require(:subscription).permit(:lastName, :firstName, :birthDate, :street, :city, :postalCode, :telefonNumber, :email, :sport_module_id, :sports_training_id, :activity_afternoon_id, :activity_morning_id, :swim_lesson_id, :sports_day_id, :place_id, :level_id)
    end
end
