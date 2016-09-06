class SubscriptionMailer < ApplicationMailer

  def swim_lesson_reminder(subscription)
    @subscription = subscription

    mail( :to => @subscription.email,
          :subject => subscription.swim_lesson.maxSubscriptions==1? t('swim_lesson_reminder_subject_individual') : t('swim_lesson_reminder_subject'))
  end

  def sport_module_reminder(subscription)
    @subscription = subscription
    mail( :to => @subscription.email,
          :subject => t('sport_module_reminder_subject'))
  end

  def sports_day_confirmation(subscription)
    @subscription = subscription
    mail( :to => @subscription.email,
          :subject => t('sports_day_confirmation_subject', lastName: subscription.lastName.capitalize, firstName: subscription.firstName.capitalize))
  end

  def sports_training_confirmation(subscription)
    @subscription = subscription
    @activities = Activity.all
    mail( :to => @subscription.email,
          :subject => t('sports_training_confirmation_subject', lastName: subscription.lastName.capitalize, firstName: subscription.firstName.capitalize))
  end

  def swim_lesson_confirmation(subscription)
    @subscription = subscription
    mail( :to => @subscription.email,
          :subject => t('swim_lesson_confirmation_subject', lastName: subscription.lastName.capitalize, firstName: subscription.firstName.capitalize),
          :template_name => subscription.swim_lesson.maxSubscriptions==1? 'swim_lesson_confirmation_individual' : 'swim_lesson_confirmation')
  end

  def sport_module_confirmation(subscription)
    @subscription = subscription
    mail( :to => @subscription.email,
          :subject => t('sport_module_confirmation_subject', lastName: subscription.lastName.capitalize, firstName: subscription.firstName.capitalize),
          :template_name => 'sport_module_'+ subscription.sport_module.activity.downcase + '_confirmation')
  end

  def adult_swim_lesson_confirmation(subscription)
    @subscription = subscription
    mail( :to => 'marchetti.sebastien@gmail.com',
          :subject => t('adult_swim_lesson_confirmation_subject', lastName: subscription[:lastName].capitalize, firstName: subscription[:firstName].capitalize))
  end

  def birthday_confirmation(subscription)
    @subscription = subscription
    mail( :to => 'marchetti.sebastien@gmail.com',
          :subject => t('birthday_confirmation_subject', lastName: subscription[:lastName].capitalize, firstName: subscription[:firstName].capitalize))
  end

end
