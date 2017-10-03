
# formats bank statement for output
class Formatter
  def print_statement(transactions)
    print_headings
    print_transactions(transactions)
  end

  private

  def print_headings
    puts format_row('date', 'credit', 'debit', 'balance')
  end

  def print_transactions(transactions)
    puts format_transactions(transactions)
  end

  def format_transactions(transactions)
    transactions.map do |transaction|
      format_row(*transaction.values)
    end
  end

  def format_row(*values)
    values.join(' || ') << "\n"
  end
end
