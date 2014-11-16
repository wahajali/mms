module ExpensesHelper
  def cost_centers
    result = %w[Corporate Manufacturing Institute Trading Laboratory Pharmacy Trust Clinic].map do |obj|
      a = Object.const_get(obj)
      a.all.to_a
    end
    result.flatten!
  end
end
