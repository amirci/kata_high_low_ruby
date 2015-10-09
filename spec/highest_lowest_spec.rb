require 'rantly/rspec_extensions'

class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

def highest_lowest(str)
  str.split.map(&:to_i).inject([Integer::MIN, Integer::MAX]) { |mm, i| [[mm.first, i].max, [mm.last, i].min] }.join ' '
end

describe 'Highest and lowest' do

  context 'When the string has only one number' do
    it 'Returns the same number twice' do
      property_of {
        integer.to_s
      }.check do |str|
        expect(highest_lowest str).to eq "#{str} #{str}"
      end
    end
  end

  context 'When the numbers are sorted' do
    it 'returns the last and the first' do
      property_of {
        arr = array(10) { integer }.sort
        [arr.join(' '), arr.last, arr.first]
      }.check { |str, max, min|
        expect(highest_lowest str).to eq "#{max} #{min}"
      }
    end
  end

  context 'For any string with one or more numbers separated by space' do
    it 'returns the max and the min' do
      property_of {
        len = range 1, 1000
        min, max = [integer, integer].minmax
        arr = array(len) { range min, max } + [max, min]
        [arr.shuffle.join(' '), max, min]
      }.check { |str, max, min| 
        expect(highest_lowest str).to eq "#{max} #{min}"
      }
    end
  end
end
