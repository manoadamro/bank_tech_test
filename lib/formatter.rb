
# in lib/formatter.rb
class Formatter
  def initalize; end

  def show_log(log)
    output = log_headings
    log.reverse!.each do |entry|
      output += format_log_entry(entry)
    end
    puts output
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

  def parse_amount(amount)
    return amount.to_s, '' if amount >= 0
    ['', amount.to_s]
  end

  def format_log_entry(entry)
    credit, debit = parse_amount(entry.amount)
    format_row(entry.date, credit, debit, entry.balance)
  end
end
