class UserPolicy

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def is_admin?
    @user.present? && @user.admin?
  end
end
