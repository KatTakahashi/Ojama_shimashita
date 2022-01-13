class Public::HomesController < ApplicationController
  
  def top
  end
  
  def about
    #お問い合わせ機能用
    @contact = Contact.new
  end
  
end
