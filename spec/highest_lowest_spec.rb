MIN = -100000000
MAX = 1000000000

def highest_lowest(str)
  str.split.map(&:to_i).inject([MIN, MAX]) { |mm, i| [[mm.first, i].max, [mm.last, i].min] }.join ' '
end

describe 'Highest and lowest' do

  context 'When the string has only one number' do
    it 'Returns the same number twice' do
      str = "1"
      expect(highest_lowest str).to eq "1 1"
    end
  end

  context 'When the numbers are sorted' do
    it 'returns the last and the first' do
      str = '-5 -2 8 12 32 150'
      expect(highest_lowest str).to eq "150 -5"
    end
  end

  context 'For any string with one or more numbers separated by space' do
    it 'returns the max and the min' do
      str = '22 -5 28 -294 33 1794 10000 2'
      expect(highest_lowest str).to eq "10000 -294"
    end
  end
end
