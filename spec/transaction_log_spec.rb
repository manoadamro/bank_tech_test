require_relative('../lib/transaction_log.rb')

describe 'Transaction Log' do

  subject { TransactionLog.new }
  let(:transaction) { double(:transaction) }

  describe '#new' do
    it 'log starts empty' do
      expect(subject.log).to be_empty
    end
  end

  describe '#add_transaction' do
    it 'adds transaction to list' do
      subject.add_transaction(1)
      expect(subject.log.length).to eq(1)
    end

    it 'does not modify transaction' do
      subject.add_transaction(2)
      expect(subject.log[0]).to eq(2)
    end
  end

  describe '#current_balance' do

    it 'gets balance from transaction' do
      allow(transaction).to receive(:balance).and_return(100)
      expect(transaction).to receive(:balance).exactly(1).times
      subject.add_transaction(transaction)
      subject.current_balance
    end
  end

  describe '#reverse' do

    it 'reverses order of log' do
      subject.add_transaction(1)
      subject.add_transaction(2)
      subject.add_transaction(3)
      expect(subject.reverse).to eq([3, 2, 1])
    end
  end

end
