
class TransactionLog
  attr_reader :log

  def initialize
    @log = []
  end

  def add_transaction(transaction)
    @log << transaction
  end

  def current_balance
    return 0 if @log.empty?
    @log.last.balance
  end

  def reverse
    @log.reverse
  end
end
