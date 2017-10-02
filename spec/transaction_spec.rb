require_relative('../lib/transaction.rb')

describe 'Transaction' do
  describe '#new' do
    let(:amount) { 420 }
    let(:date) { '4/20/69' }
    let(:balance) { 420 }

    let(:transaction_klass) { Transaction }
    subject { Transaction.new(amount, date, balance) }

    it 'responds to #new' do
      expect(transaction_klass).to respond_to(:new).with(3).arguments
    end

    it 'allows access to .amount' do
      expect(subject).to respond_to(:amount)
    end

    it 'sets amount' do
      expect(subject.amount).to eq(amount)
    end

    it 'allows access to .date' do
      expect(subject).to respond_to(:date)
    end

    it 'sets date' do
      expect(subject.date).to eq(date)
    end

    it 'allows access to .balance' do
      expect(subject).to respond_to(:balance)
    end

    it 'sets balance' do
      expect(subject.balance).to eq(balance)
    end
  end
end
