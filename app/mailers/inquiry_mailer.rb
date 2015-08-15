class InquiryMailer < ApplicationMailer
	default to: "l.m.myeongho.lee@gmail.com" 
  default from: "l.m.myeongho.lee@gmail.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'テスト')
  end

end
