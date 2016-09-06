module Admin::SubscriptionHelper

  def getHeaderRow()
    header = [t('subscription_doc_lastName'), t('subscription_doc_firstName'), t('subscription_doc_birthDate'), t('subscription_doc_telefon_number'), t('subscription_doc_email'), t('subscription_doc_street'), t('subscription_doc_postal_code'), t('subscription_doc_city')]
    case @subscriptionType
      when SportModuleSubscription.name, SwimLessonSubscription.name
        header.append(t('subscription_doc_due_date'))
      when SportsTrainingSubscription.name
        header.append(t('subscription_doc_morning_activity'))
        header.append(t('subscription_doc_afternoon_activity'))
    end
    header
  end

  def getBodyRow(subscription)
    row = [subscription.lastName, subscription.firstName, l(subscription.birthDate), subscription.telefonNumber, subscription.email, subscription.street, subscription.postalCode, subscription.city]
    if(subscription.instance_of?SwimLessonSubscription or subscription.instance_of?SportModuleSubscription)
      row.append(l(subscription.dueDate))
    else
      if(subscription.instance_of?SportsTrainingSubscription)
        row.append(@activities.find(subscription.activity_morning_id).name)
        row.append(@activities.find(subscription.activity_afternoon_id).name)
      end
    end
    row
  end
end