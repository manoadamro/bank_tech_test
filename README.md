# Bank (tech test)

___
## Usage

  -  navigate to directory and run ```ruby app.rb``` in terminal:

___
## Classes:

##### Account:

  - _Constructor Arguments:_
    - Transaction (transaction class)
    - Formatter (formatter class)


  - _Methods:_
    - transaction (amount, date)
      - amount: the change in balance (can be positive or negative)
      - date: the transaction date as a string
      - creates a new transaction object
      - no return behaviour


##### Transaction:

  - _Constructor Arguments:_
    - amount: the change in balance (can be positive or negative)
    - date: the transaction date as a string
    - balance: the new balance (old + amount)


  - _Methods:_
    - None


##### Formatter:

  - _Constructor Arguments:_
    - None


  - _Methods:_
    - show_log:
      - log: list of transaction objects
      - outputs log entries in table format
      - no return behaviour
    - confirm_transaction:
      - transaction: a object
      - outputs confirmation of transaction and new balance
      - no return behaviour

___
## Specs
  - Interact with code via REPL.
  - Deposit money by amount.
  - Withdraw money by amount.
  - Show account statement.
    - Data stored in memory.

    
#### Example:
  - Client deposits 1000 on 10-01-2012
  - Client deposits 2000 on 13-01-2012
  - Client withdraws 500 on 14-01-2012
  - Statement would read:
        date       || credit    || debit  || balance
        14/01/2012 ||           || 500.00 || 2500.00
        13/01/2012 || 2000.00   ||        || 3000.00
        10/01/2012 || 1000.00   ||        || 1000.00

___
