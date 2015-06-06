class ReportsController < ApplicationController

  # GET /balance_sheet
  def balance_sheet
    cost_centerable_type = params["cost_centerable"].split(';').first
    cost_centerable_id = params["cost_centerable"].split(';').last
    @expenses = Expense.where('bal_sheet_or_pl = ? AND (date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ?', 'Balance Sheet', params[:from], params[:to], cost_centerable_id, cost_centerable_type)
    @incomes = Income.where('bal_sheet_or_pl = ? AND (date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ?', 'Balance Sheet', params[:from], params[:to], cost_centerable_id, cost_centerable_type)
    @both = @expenses + @incomes
    @both.sort_by! { |x| [x.bs_or_pl_category_id, x.date] }
  end

  # GET /pnl
  def pnl
    cost_centerable_type = params["cost_centerable"].split(';').first
    cost_centerable_id = params["cost_centerable"].split(';').last
    @expenses = Expense.where('bal_sheet_or_pl = ? AND (date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ?', 'Profit & Loss', params[:from], params[:to], cost_centerable_id, cost_centerable_type)
    @incomes = Income.where('bal_sheet_or_pl = ? AND (date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ?', 'Profit & Loss', params[:from], params[:to], cost_centerable_id, cost_centerable_type)
    @both = @expenses + @incomes
    @both.sort_by! { |x| [x.bs_or_pl_category_id, x.date] }
  end

  # GET /reports
  def reports
  end

  def fetch_report
    report_types = ['expenses', 'income', 'bs', 'pl', 'esc', 'ec', 'isc', 'ic']
    cost_centerable_type = params["cost_centerable"].split(';').first
    cost_centerable_id = params["cost_centerable"].split(';').last
    report = params[:report_type]
    @cost_center = cost_centerable_type.constantize.find_by_id(cost_centerable_id)
    @to = params[:to]
    @from = params[:from]

    respond_to do |format|
      case report
      when "expenses"
        @expenses = Expense.where('(date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ?', params[:from], params[:to], cost_centerable_id, cost_centerable_type).order('date DESC')
        format.html { render :expenses }
      when "esc"
        @expenses = Expense.where('(date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ? AND expense_sub_category_id = ?', @from, @to, @cost_center.id, @cost_center.class.to_s, params[:esc]).order('date DESC')
        format.html { render :esc }
      when "ec"
        @expenses = Expense.where('(date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ? AND expense_category_id = ?', @from, @to, @cost_center.id, @cost_center.class.to_s, params[:ec]).order('date DESC')
        format.html { render :ec }
      when "et"
        @expenses = Expense.where('(date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ? AND expense_type_id = ?', @from, @to, @cost_center.id, @cost_center.class.to_s, params[:et]).order('date DESC')
        format.html { render :et }
      when "rcpt"
        @expenses = Expense.where('(date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ? AND expense_category_id = ?', @from, @to, @cost_center.id, @cost_center.class.to_s, params[:ec]).order('date DESC')
      when "isc"
        format.html { render :isc }
      when "ic"
        format.html { render :ic }
      when "income"
        format.html { render :income }
      when "bs"
        format.html { render :bs }
      when "pl"
        format.html { render :pl }
      end
    end
  end

end
