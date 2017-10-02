require_relative('./lib/account')
require_relative('./lib/transaction')
require_relative('./lib/formatter')


account = Account.new(Transaction, Formatter)

account.transaction(1000, '10/01/2012')
account.transaction(2000, '13/01/2012')
account.transaction(-500, '14/01/2012')

account.show_log
