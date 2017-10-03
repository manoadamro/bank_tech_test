require('./lib/formatter.rb')

describe 'Formatter' do
  subject { Formatter.new }
  let(:transaction) { double(:transaction) }

  let(:transactions) do
    [transaction, transaction, transaction]
  end
  before do
    allow(transaction).to receive(:values).and_return(['1/2/3', 100, 0, 100])
  end

  describe '#print_statement' do
    it 'ouputs in correct format' do
      output = \
        "date || credit || debit || balance\n"\
        "1/2/3 || 100 || 0 || 100\n"\
        "1/2/3 || 100 || 0 || 100\n"\
        "1/2/3 || 100 || 0 || 100\n"
      expect do
        subject.print_statement(transactions)
      end.to output(output).to_stdout
    end
  end
end
