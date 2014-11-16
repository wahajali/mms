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
end
