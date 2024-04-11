# frozen_string_literal: true

# Допишите валидатор для корреспондентского счета
# CorAccountValidator
class CorAccountValidator
  attr_reader :account, :bik

  BIK_LENGTH = 9
  ACCOUNT_LENGTH = 20
  BIK_PREFIX = '04'
  COR_ACCOUNT_PREFIX = '301'

  def initialize(account:, bik:)
    @account = account
    @bik = bik
  end

  def valid?
    return false unless valid_bik? && valid_account?

    control_number = calculate_control_number
    (control_number % 10).zero?
  end

  private

  def valid_bik?
    bik.length == BIK_LENGTH && bik.start_with?(BIK_PREFIX)
  end

  def valid_account?
    account.length == ACCOUNT_LENGTH && account.start_with?(COR_ACCOUNT_PREFIX)
  end

  def calculate_control_number
    combined_number = '0' + bik[4..5] + account
    weights = [7, 1, 3].cycle.take(combined_number.length)

    combined_number.chars.zip(weights).reduce(0) do |accumulator, (digit, weight)|
      accumulator + digit.to_i * weight
    end
  end
end
