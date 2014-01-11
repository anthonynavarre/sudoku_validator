module Sudoku
  class Cells
    def initialize(cells)
      @cells = cells
    end

    def valid?
      solved_cells.uniq.length + unsolved_cells.length == cells.length
    end

    def complete?
      cells == solved_cells
    end

    private

    attr_reader :cells

    def solved_cells
      cells.select do |cell|
        cell.is_a?(Fixnum)
      end
    end

    def unsolved_cells
      cells.reject do |cell|
        cell.is_a?(Fixnum)
      end
    end
  end
end
