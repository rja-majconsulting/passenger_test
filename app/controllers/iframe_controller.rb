class IframeController < ActionController::Base
  layout 'iframe/iframe'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show_birthday_iframe
    render 'iframe/birthday'
  end

  def show_swimming_iframe
    render 'iframe/swimming'
  end

  def show_swimming_children_iframe
    render 'iframe/swimming_children'
  end

  def show_school_iframe
    render 'iframe/school'
  end

  def show_sports_training_iframe
    render 'iframe/sports_training'
  end

  def show_sport_module_iframe
    render 'iframe/sport_module'
  end
end
