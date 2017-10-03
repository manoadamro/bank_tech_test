require_relative('./transaction')
require_relative('./formatter')

# keeps a log of transactions and balance, show statement on request
class Account
  attr_reader :log, :balance

  def initialize(transaction_klass = Transaction, formatter = Formatter.new)
    @transaction_klass = transaction_klass
    @formatter = formatter
    @balance = 0
    @log = []
  end

  def transaction(amount, date)
    @balance += amount
    transaction = @transaction_klass.new(amount, date, @balance)
    @log << transaction
  end

  def show_statement
    @formatter.format_transaction_log(@log.reverse)
  end
end
