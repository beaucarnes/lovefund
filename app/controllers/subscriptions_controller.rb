class SubscriptionsController < ApplicationController

  # GET /posts/new
  def new
    @subscription = Subscription.new
  end
  
  def create
    @subscription = Subscription.new(sub_params)
    if @subscription.save
      #@subscription.send_notification_email
      flash[:success] = "You have subscribed!"
      redirect_to root_url
    else
      render :new
    end
  end
  
  def show
    if params[:unsubscribe] = 'true'
      @Subscription = Subscription.find(params[:id])
      redirect_to subscription_path(@Subscription, method: :delete)
    else
      redirect_to root_url
    end
  end
  
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { flash[:success] = "Successfully unsubscribed!"; redirect_to root_url}
      format.json { head :no_content }
    end
  end
  
  def unsubscribe
    @subscription = Subscription.find(params[:subscription_id])
    @subscription.destroy
    respond_to do |format|
      format.html { flash[:success] = "Successfully unsubscribed!"; redirect_to root_url}
      format.json { head :no_content }
    end
  end
  
  private

    def sub_params
      params.require(:subscription).permit(:email, :term, :wants_rp, :wants_rh, :wants_oh, :wants_op)
    end

  
end


