class HomeController < ApplicationController

  skip_before_filter :authenticate_user!, :except => [:balance_sheet, :pnl]
  
  # GET /home
  def home
  end

  # GET /about
  def about
  end

  # GET /contact
  def contact
  end
  
  # GET /faq
  def faq
  end

  # GET /balance_sheet
  def balance_sheet
  end

  # GET /pnl
  def pnl
  end
end
