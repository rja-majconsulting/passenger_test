class Admin::DashboardController < AdminController

  def index
    @subscriptions = Subscription.search(params[:name], params[:firstName])
    if @subscriptions
      @subscriptions_by_type = @subscriptions.group_by {|x| x.type}
    end
  end



end
