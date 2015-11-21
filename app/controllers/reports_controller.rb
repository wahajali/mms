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
    @cost_centerable_type = params[:cost_centerable].collect { |a| a.split(";").first }
    @cost_centerable_type.compact!
    @cost_centerable_id = params[:cost_centerable].collect { |a| a.split(";").last }
    @cost_centerable_id.compact!
    report = params[:report_type]
    @cost_center = @cost_centerable_type.map { |a| a.constantize.find_by_id(@cost_centerable_id) }

    # dates
    @to = params[:to]
    @from = params[:from]

    #income data
    @benefactor = params[:benefactor] if params[:receipient].present?
    @income_type = IncomeType.find(params[:income_type_id]) if params[:income_type_id].present?
    @income_category = IncomeCategory.find(params[:income_category_id]) if params[:income_category_id].present?
    @income_sub_category = IncomeSubCategory.find(params[:income_sub_category_id]) if params[:income_sub_category_id].present?

    #expense data
    @receipient = params[:receipient] if params[:receipient].present?
    @expense_type = ExpenseType.find(params[:expense_type_id]) if params[:expense_type_id].present?
    @expense_category = ExpenseCategory.find(params[:expense_category_id]) if params[:expense_category_id].present?
    @expense_sub_category = ExpenseSubCategory.find(params[:expense_sub_category_id]) if params[:expense_sub_category_id].present?

    #medicine data
    @medicine_type_id = MedicineType.find(params[:medicine_type_id]) if params[:medicine_type_id].present?

    respond_to do |format|
      case report
      when "expenses"
        @expenses = Expense.where('date >= ?', @from)
        @expenses = @expenses.where('date <= ?', @to) if @from
        query = "("
        size = @cost_center.size
        @cost_center.each_with_index do |a, i|
          if i < size && i != 0
            query = query + " OR (cost_centerable_id = #{a.id} AND cost_centerable_type = \"#{a.class.to_s}\")"
          else
            query = query + "(cost_centerable_id = #{a.id} AND cost_centerable_type = \"#{a.class.to_s}\")"
          end 
        end
        query = query + ")"
        @expenses = @expenses.where(query)
        @expenses = @expenses.where('receipient = ?', @receipient) if @receipient
        @expenses = @expenses.where('expense_type_id = ?', @expense_type.id) if @expense_type
        @expenses = @expenses.where('expense_category_id = ?', @expense_category.id) if @expense_category
        @expenses = @expenses.where('expense_sub_category_id = ?', @expense_sub_category.id) if @expense_sub_category
        @expenses.order('date DESC')
        @expenses.paginate(page: 1, per_page: 3)
        format.html { render :expenses }
      when "income"
        @incomes = Income.where('date >= ?', @from)
        @incomes = @incomes.where('date <= ?', @to) if @from
        query = "("
        size = @cost_center.size
        @cost_center.each_with_index do |a, i|
          if i < size && i != 0
            query = query + " OR (cost_centerable_id = #{a.id} AND cost_centerable_type = \"#{a.class.to_s}\")"
          else
            query = query + "(cost_centerable_id = #{a.id} AND cost_centerable_type = \"#{a.class.to_s}\")"
          end 
        end
        query = query + ")"
        @incomes = @incomes.where(query)
        @incomes = @incomes.where('benefactor = ?', @benefactor) if @benefactor
        @incomes = @incomes.where('income_type_id = ?', @income_type.id) if @income_type
        @incomes = @incomes.where('income_category_id = ?', @income_category.id) if @income_category
        @incomes = @incomes.where('income_sub_category_id = ?', @income_sub_category.id) if @income_sub_category
        @incomes.order('date DESC')
        format.html { render :incomes }
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
      when "bs"
        format.html { render :bs }
      when "pl"
        format.html { render :pl }
      end
    end
  end

end
