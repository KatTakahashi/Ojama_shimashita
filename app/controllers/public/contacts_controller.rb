class Public::ContactsController < ApplicationController
  before_action :authenticate_member! only:[:new, :create]
  
# --------------- お問い合わせページ --------------
  def new
    @contact = Contact.new
  end
  
# --------------- お問い合わせ送信機能 ---------------
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
# --------------- ストロングパラメータ ---------------
  def contact_params
    params.require(:contact).permit(:email, :name, :message)
  end
  
end
