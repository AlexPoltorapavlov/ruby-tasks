# Допишите валидатор для корреспондентского счета

class CorAccountValidator
  attr_reader :account, :bik

  def initialize(account:, bik:)
    @account = account
    @bik = bik
  end

  def valid?
    # your code
  end
end
