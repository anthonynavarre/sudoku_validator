require 'rspec'
require 'sudoku/board'

module Sudoku
  describe Board do
    describe '#valid?' do
      context 'when containing any invalid rows' do
        it 'returns false' do
          board = Board.new([
            1,2,3,4,5,6,7,8,8,
            2,3,4,5,6,7,8,9,1,
            3,4,5,6,7,8,9,1,2,
            4,5,6,7,8,9,1,2,3,
            5,6,7,8,9,1,2,3,4,
            6,7,8,9,1,2,3,4,5,
            7,8,9,1,2,3,4,5,6,
            8,9,1,2,3,4,5,6,7,
            9,1,2,3,4,5,6,7,8
          ])
          expect(board).not_to be_valid
        end
      end

      context 'when containing any invalid sectors' do
        it 'returns false' do
          board = Board.new([
            8, 5, [], [], [], 2, 4, [], [],
            7, 2, [], [], [], [], [], [], 9,
            [], [], 4, [], [], [], [], [], [],
            [], [], [], 1, [], 7, [], [], 2,
            3, [], 5, [], [], [], 9, [], [],
            [], 4, [], [], [], [], [], [], [],
            [], [], 1, [], 8, [], [], 7, [],
            [], 1, 7, [], [], [], [], [], [],
            [], [], [], [], 3, 6, [], 4, []
          ])
          expect(board).not_to be_valid
        end
      end

      context 'when containing any invalid columns' do
        it 'returns false' do
          board = Board.new([
            [1,2],[1,2],3,4,5,6,7,8,9,
            2,3,4,5,6,7,8,9,1,
            2,4,5,6,7,[1,8],9,3,[1,8],
            4,5,6,7,8,9,1,2,3,
            5,6,7,8,9,1,2,3,4,
            6,7,8,9,1,2,3,4,5,
            7,8,9,1,2,3,4,5,6,
            8,9,1,2,3,4,5,6,7,
            9,1,2,3,4,5,6,7,8
          ])
          expect(board).not_to be_valid
        end
      end

      context 'when containing valid rows' do
        it 'returns true' do
          board = Board.new([
            8, 5, [], [], [], 2, 4, [], [],
            7, 2, [], [], [], [], [], [], 9,
            [], [], 4, [], [], [], [], [], [],
            [], [], [], 1, [], 7, [], [], 2,
            3, [], 5, [], [], [], 9, [], [],
            [], 4, [], [], [], [], [], [], [],
            [], [], [], [], 8, [], [], 7, [],
            [], 1, 7, [], [], [], [], [], [],
            [], [], [], [], 3, 6, [], 4, []
          ])
          expect(board).to be_valid
        end
      end

      pending 'when containing unsolved cells'
    end
  end
end
