

def highest_lowest(str)
  "#{str} #{str}"
end

describe 'Highest and lowest' do

  context 'When the string has only one number' do
    it 'Returns the same number twice' do
      str = "1"
      expect(highest_lowest str).to eq "#{str} #{str}"
    end
  end

end
