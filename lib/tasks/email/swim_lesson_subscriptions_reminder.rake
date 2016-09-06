require File.expand_path(File.dirname(__FILE__) + "/../../../config/environment")


namespace :email do
  desc 'Send all subscription reminders'
  task :send_all_subscription_reminders => [:environment, :swim_lesson_subscriptions_reminder, :sport_module_subscriptions_reminder]  do
    puts "Sending all subscription reminders"
  end

  desc 'Send reminder email for swim lesson subscription'
  task :swim_lesson_subscriptions_reminder => :environment  do
    subscriptions = SwimLessonSubscription.where(:lastName => 'Marchetti')
    subscriptions.each do |subscription|
      SubscriptionMailer.swim_lesson_reminder(subscription).deliver
    end

  end

  desc 'Send reminder email for sport module subscription'
  task :sport_module_subscriptions_reminder => :environment  do
    subscriptions = SportModuleSubscription.where(:lastName => 'Tata')
    subscriptions.each do |subscription|
      SubscriptionMailer.sport_module_reminder(subscription).deliver
    end
  end
end