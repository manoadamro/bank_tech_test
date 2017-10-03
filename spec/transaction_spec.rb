require('./lib/transaction')

describe 'Transaction' do
  subject { Transaction.new(100, '1/2/3', 100) }

  describe '#new' do
    it 'responds to new' do
      expect(Transaction).to respond_to(:new).with(3).arguments
    end

    it 'sets date' do
      expect(subject.date).to eq('1/2/3')
    end

    it 'sets credit' do
      expect(subject.credit).to eq(100)
    end

    it 'sets debit' do
      debit_transaction = Transaction.new(-100, '1/2/3', 100)
      expect(debit_transaction.debit).to eq(100)
    end

    it 'sets balance' do
      expect(subject.balance).to eq(100)
    end
  end

  describe '#values' do
    it 'returns correct values in correct order' do
      expect(subject.values).to eq(['1/2/3', 100, 0, 100])
    end
  end
end
