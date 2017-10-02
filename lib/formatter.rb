
# in lib/formatter.rb
class Formatter
  def initalize;end

  def show_log(log);
    output = ""
    log.each do |entry|
      output += format_log_entry(entry)
    end
    puts output
  end

  def confirm_transaction(transaction);
    type = transaction_type(transaction.amount)
    amount = transaction.amount
    balance = transaction.balance
    puts "confirmed #{type} of #{amount}.\nnew balance: #{balance}"
  end

  private

  def transaction_type(amount)
    return 'deposit' if amount >= 0
    'withdrawal'
  end

  def format_log_entry(entry)
    ""
  end
end
