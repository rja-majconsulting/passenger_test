class AdminController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_action :authenticate_user!
  layout 'admin/admin'
  protect_from_forgery with: :exception


end
