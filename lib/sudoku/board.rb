require 'sudoku/cells'

module Sudoku
  class Board
    def initialize(cells)
      @cells = cells
    end

    def valid?
      rows.all?(&:valid?) &&
        columns.all?(&:valid?) &&
        sectors.all?(&:valid?)
    end

    private

    attr_reader :cells

    def rows
      cells.each_slice(9).map { |slice| Cells.new(slice) }
    end

    def columns
      (0..8).map do |n|
        lower_bound = n
        higher_bound = n + 72

        col_cells = (lower_bound..higher_bound).step(9).to_a.map do |i|
          cells[i]
        end

        Cells.new(col_cells)
      end
    end

    def sectors
      [
        cells.values_at(0, 1, 2, 9, 10, 11, 18, 19, 20),
        cells.values_at(3, 4, 5, 12, 13, 14, 21, 22, 23),
        cells.values_at(6, 7, 8, 15, 16, 17, 24, 25, 26),
        cells.values_at(27, 28, 29, 36, 37, 38, 45, 46, 47),
        cells.values_at(30, 31, 32, 39, 40, 41, 48, 49, 50),
        cells.values_at(33, 34, 35, 42, 43, 44, 51, 52, 53),
        cells.values_at(54, 55, 56, 63, 64, 65, 72, 73, 74),
        cells.values_at(57, 58, 59, 66, 67, 68, 75, 76, 77),
        cells.values_at(60, 61, 62, 69, 70, 71, 78, 79, 80)
      ].map {|sector_cells| Cells.new(sector_cells) }
    end
  end
end
