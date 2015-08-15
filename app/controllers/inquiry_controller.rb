class InquiryController < ApplicationController
  def index
  	@inquiry = Inquiry.new
  	@user = current_user 
    render :action => 'index'
  end

  def confirm
  	@inquiry = Inquiry.new(inquiry_params)
  	@user = current_user 
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def thanks
  	@inquiry = Inquiry.new(inquiry_params)
  	@user = current_user 
    # send mail
    InquiryMailer.received_email(@inquiry).deliver

    flash[:notice] = "お問い合わせ頂き、ありがとうございました。"
    render :action => 'thanks'
  end
  private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
    end
end
