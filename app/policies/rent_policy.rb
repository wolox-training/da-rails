class RentPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def resolve
    scope.all
  end

  def create?
    user.id == record.user.id
  end
end
