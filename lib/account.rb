
class Account
  attr_accessor :transaction_log

  def initialize(transaction_klass, formatter_klass)
    @transaction_klass = transaction_klass
    @formatter = formatter_klass.new
    @transaction_log = []
  end

  def transaction(amount, date)
    new_balance = 0
    transaction = @transaction_klass.new(amount, date, new_balance)
    @transaction_log << transaction
    @formatter.confirm_transaction(transaction)
  end

  def show_log
    @formatter.show_log(@transaction_log)
  end
end
