
# in lib/account.rb
class Account
  attr_accessor :transaction_log

  def initialize(transaction_klass, formatter_klass)
    @transaction_klass = transaction_klass
    @formatter = formatter_klass.new
    @transaction_log = []
  end

  def transaction(amount, date)
    new_balance = balance + amount
    transaction = @transaction_klass.new(amount, date, new_balance)
    @transaction_log << transaction
    @formatter.confirm_transaction(transaction)
  end

  def show_log
    @formatter.show_log(@transaction_log)
  end

  def balance
    if transaction_log.empty?
      0
    else
      transaction_log.last.balance
    end
  end
end
