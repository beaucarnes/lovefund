class SubscriptionController < ApplicationController

  # GET /posts/new
  def new
    @subscription = Subscription.new
  end
  
   def create
    @subscription = Subscription.new(sub_params)
    if @subscription.save
      @subscription.send_notification_email
      flash[:success] = "You have subscribed!"
      redirect_to root_url
    else
      render :new
    end
  end
  
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { flash[:success] = "Successfully deleted!"; redirect_to @post}
      format.json { head :no_content }
    end
  end
  
  private
        # Never trust parameters from the scary internet, only allow the white list through.
    def sub_params
      params.require(:subscription).permit(:email, :term, :wants_rp, :wants_rh, :wants_oh, :wants_op)
    end

  
end


