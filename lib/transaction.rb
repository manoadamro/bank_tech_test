
# a single withdrawal or deposit
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(amount, date, balance)
    @date = date
    @credit, @debit = parse_amount(amount)
    @balance = balance
  end

  def values
    [@date, @credit, @debit, @balance]
  end

  private

  def parse_amount(amount)
    return amount, 0 if amount >= 0
    [0, amount.abs]
  end
end
