require_relative('../lib/formatter.rb')

describe 'Formatter' do
  let(:formatter_klass) { Formatter }
  subject { Formatter.new }

  let(:tr1) { double(:transaction1) }
  let(:tr2) { double(:transaction2) }
  let(:tr3) { double(:transaction3) }

  describe '#new' do
    it 'responds to #new' do
      expect(formatter_klass).to respond_to(:new).with(0).arguments
    end
  end

  describe '#show_log' do
    it 'responds to #show_log' do
      expect(subject).to respond_to(:show_log).with(1).arguments
    end

    it 'outputs to stdout' do
      allow(tr1).to receive_messages(amount: 100, date: '1/2/3', balance: 100)
      allow(tr2).to receive_messages(amount: 200, date: '2/2/3', balance: 300)
      allow(tr3).to receive_messages(amount: -50, date: '3/2/3', balance: 250)

      log = [tr1, tr2, tr3]
      output = "||date      ||credit    ||debit     ||balance   ||\n" \
               "||3/2/3     ||          ||-50       ||250       ||\n" \
               "||2/2/3     ||200       ||          ||300       ||\n" \
               "||1/2/3     ||100       ||          ||100       ||\n"
      expect { subject.show_log(log) }.to output(output).to_stdout
    end
  end

  describe '#confirm_transaction' do
    it 'responds to #confirm_transaction' do
      expect(subject).to respond_to(:confirm_transaction).with(1).arguments
    end

    it 'outputs deposit to stdout' do
      allow(tr1).to receive_messages(amount: 100, date: '1/2/3', balance: 100)

      output = "confirmed deposit of 100.\nnew balance: 100\n\n"
      expect { subject.confirm_transaction(tr1) }.to output(output).to_stdout
    end

    it 'outputs withdrawal to stdout' do
      allow(tr1).to receive_messages(amount: -50, date: '1/2/3', balance: 50)

      output = "confirmed withdrawal of -50.\nnew balance: 50\n\n"
      expect { subject.confirm_transaction(tr1) }.to output(output).to_stdout
    end
  end
end
