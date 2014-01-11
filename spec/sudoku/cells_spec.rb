require 'rspec'
require 'sudoku/cells'

module Sudoku
  describe Cells do
    describe '#complete?' do
      context 'when containing only solved cells' do
        it 'returns true' do
          row = Cells.new([1,2,3,4,5,6,7,8,9])
          expect(row).to be_complete
        end 
      end

      context 'when continaing any unsolved cells' do
        it 'returns true' do
          row = Cells.new([1,2,3,4,5,6,[7,8],[7,8],9])
          expect(row).not_to be_complete
        end 
      end
    end

    describe '#valid?' do
      context 'when containing no duplicate numbers' do
        it 'returns true' do
          row = Cells.new([1,2,3,4,5,6,7,8,9])
          expect(row).to be_valid
        end
      end

      context 'when containing duplicate numbers' do
        it 'returns false' do
          row = Cells.new([1,2,3,4,5,6,7,8,8])
          expect(row).not_to be_valid
        end
      end

      context 'when containing unsolved cells' do
        it 'returns true' do
          row = Cells.new([[1,2],[1,2],3,4,5,6,7,8,9])
          expect(row).to be_valid
        end
      end
    end
  end
end
