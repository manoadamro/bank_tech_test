
describe 'Account' do
  describe '#new' do
    it 'responds to #new'

    it 'takes in a type for balance'

    it 'takes in a type for formatter'

    it 'allows access to log'

    it 'log starts empty'
  end

  describe '#transaction' do
    it 'responds to #transaction'

    it 'takes in an amount and a date'

    it 'date parameter defaults to todays date if undefined'

    it 'sets balance in transaction object'

    it 'adds date to log'

    it 'outputs confirmation'
  end

  describe '#show_log' do
    it 'responds to #show_log'

    it 'calls formatter.format'

    it 'outputs log'
  end
end
