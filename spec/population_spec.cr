require "./spec_helper"

describe ConwayGameOfLife::Population do
  describe "#cells" do
    it "starts with a dead list of cells" do
      population = ConwayGameOfLife::Population.new(width: 2, length: 2)
      population.cells.size.should eq 4
      all_cells_are_dead = population.cells.all? { |cell| cell.dead? }
      all_cells_are_dead.should be_true
    end
  end

  describe "#add_cell" do
    it "adds cells to population" do
      population = ConwayGameOfLife::Population.new(width: 2, length: 2)

      cell = ConwayGameOfLife::Cell.new(alive: false)
      population.add_cell(cell, x: 0, y: 0)

      another_cell = ConwayGameOfLife::Cell.new(alive: false)
      population.add_cell(another_cell, x: 0, y: 1)

      population.cells.size.should eq 2
      population.cells.first.should eq cell
      population.cells.last.should eq another_cell
    end
  end

  describe "#next_generation!" do
    it "kills all its cells" do
      population = ConwayGameOfLife::Population.new(width: 2, length: 2)

      cell = ConwayGameOfLife::Cell.new(alive: true)
      population.add_cell(cell, x: 0, y: 0)

      another_cell = ConwayGameOfLife::Cell.new(alive: true)
      population.add_cell(another_cell, x: 0, y: 1)

      cell.dead?.should be_false
      another_cell.dead?.should be_false

      population.next_generation!

      cell.dead?.should be_true
      another_cell.dead?.should be_true
    end
  end
end
