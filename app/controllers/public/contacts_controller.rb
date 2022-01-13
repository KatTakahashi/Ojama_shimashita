class Public::ContactsController < ApplicationController
  
  #お問い合わせ送信機能
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to root_path
    else
      render "public/homws/about"
    end
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:email,
                  :name,
                  :message
                 )
  end
  
end
