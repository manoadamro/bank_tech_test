
# in lib/formatter.rb
class Formatter
  def initalize; end

  def show_log(log)
    headings = log_headings
    table = format_table(log).join('')
    puts headings << table
  end

  def confirm_transaction(transaction)
    type = transaction_type(transaction.amount)
    amount = transaction.amount
    balance = transaction.balance
    puts "confirmed #{type} of #{amount}.\nnew balance: #{balance}\n\n"
  end

  private

  def transaction_type(amount)
    return 'deposit' if amount >= 0
    'withdrawal'
  end

  def credit_debit(amount)
    return amount.to_s, '' if amount >= 0
    ['', amount.abs.to_s]
  end

  def format_table(log)
    log.reverse.collect! do |entry|
      format_log_entry(entry)
    end
  end

  def format_column(name, width = 10)
    format("%-#{width}s||", name)
  end

  def format_row(*values)
    string = '||'
    values.each do |value|
      string += format_column(value)
    end
    string + "\n"
  end

  def log_headings
    format_row('date', 'credit', 'debit', 'balance')
  end

  def format_log_entry(entry)
    credit, debit = credit_debit(entry.amount)
    format_row(entry.date, credit, debit, entry.balance)
  end
end
