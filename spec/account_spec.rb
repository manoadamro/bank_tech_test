require_relative('../lib/account.rb')

describe 'Account' do

  let(:formatter) { double(:formatter) }

  let(:transaction) { double(:transaction) }

  let(:transaction_klass) { double(:transaction_klass) }

  let(:klass) { Account }
  subject { Account.new(transaction_klass, formatter) }

  before do
    allow(transaction_klass).to receive(:new).and_return(transaction)
    allow(formatter).to receive(:confirm_transaction)
    allow(formatter).to receive(:show_log)
  end

  context '#new' do

    it 'responds to #new with one arguement' do
      expect(klass).to respond_to(:new).with(2).arguments
    end

    it 'allows access to transaction_log' do
      expect(subject).to respond_to(:transaction_log)
    end

    it 'log starts empty' do
      expect(subject.transaction_log).to be_empty
    end
  end

  context '#transaction' do

    it 'responds to #transaction with two arguments' do
      expect(subject).to respond_to(:transaction).with(2).arguments
    end

    it 'creates a transaction object' do
      expect(transaction_klass).to receive(:new).exactly(1).times
      subject.transaction('amount', 'date')
    end

    it 'adds date to log' do
      subject.transaction('amount', 'date')
      expect(subject.transaction_log.length).to eq(1)
    end

    it 'calls formatter.confirm_transaction' do
      expect(formatter).to receive(:confirm_transaction)
      subject.transaction('amount', 'date')
    end
  end

  context '#show_log' do

    it 'responds to #show_log' do
      expect(subject).to respond_to(:show_log).with(0).arguments
    end

    it 'calls formatter.show_log' do
      expect(formatter).to receive(:show_log)
      subject.show_log()
    end
  end
end
