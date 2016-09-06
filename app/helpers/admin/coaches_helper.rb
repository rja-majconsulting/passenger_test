module Admin::CoachesHelper

  def getSwimLessonTitle()
    title = ["H5.1", "", "", "", "", "", "", "", ""]
    title
  end

  def getModuleTitle()
    title = ["H5.1", "", "", "", "", "", "", "", ""]
    title
  end

  def getHeaderRow()
    header = [t('subscription_doc_lastName'), t('subscription_doc_firstName'), t('subscription_doc_birthDate'), t('subscription_doc_telefon_number'), t('subscription_doc_email'), t('subscription_doc_street'), t('subscription_doc_postal_code'), t('subscription_doc_city'), t('subscription_doc_due_date')]
    header
  end

  def getBodyRow(subscription)
    row = [subscription.lastName, subscription.firstName, l(subscription.birthDate), subscription.telefonNumber, subscription.email, subscription.street, subscription.postalCode, subscription.city, l(subscription.dueDate)]
    row
  end
end
