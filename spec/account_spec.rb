
require('./lib/account')

describe 'Account' do
  let(:transaction_klass) { double(:transaction_klass) }
  let(:transaction) { double(:transaction) }
  let(:formatter) { double(:formatter) }

  subject { Account.new(transaction_klass, formatter) }

  before do
    allow(transaction_klass).to receive(:new).and_return(transaction)
    allow(formatter).to receive(:format_transaction_log)
  end

  describe '#new' do
    it 'responds to new' do
      expect(Account).to respond_to(:new).with(2).arguments
    end

    it 'log starts empty' do
      expect(subject.log).to be_empty
    end

    it 'balance starts at 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#transaction' do
    it 'takes in amount and date' do
      expect(subject).to respond_to(:transaction).with(2).arguments
    end

    it 'creates a transaction' do
      expect(transaction_klass).to receive(:new).exactly(1).times
      subject.transaction(100, '1/2/3')
    end

    it 'adds to log' do
      subject.transaction(100, '1/2/3')
      expect(subject.log).not_to be_empty
    end

    it 'transaction is last entry' do
      subject.transaction(100, '1/2/3')
      expect(subject.log[0]).to eq(transaction)
    end
  end

  describe '#show_statement' do
    it 'calls formatter' do
      expect(formatter).to receive(:format_transaction_log).exactly(1).times
      subject.show_statement
    end
  end
end
