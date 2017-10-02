
#in lib/transaction.rb
class Transaction
  attr_reader :amount, :date, :balance

  def initialize(amount, date, balance)
    @amount = amount
    @date = date
    @balance = balance
  end

end
