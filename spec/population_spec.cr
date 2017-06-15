require "./spec_helper"

describe ConwayGameOfLife::Population do
  describe "#initialize" do
    it "starts with a dead list of cells" do
      population = ConwayGameOfLife::Population.new(width: 2, length: 2)
      population.cells.size.should eq 4

      all_cells_are_dead = population.cells.all? { |cell| cell.dead? }
      all_cells_are_dead.should be_true
    end
  end

  describe "#size" do
    it "is based the product of population's width times it's length" do
      population = ConwayGameOfLife::Population.new(width: 1, length: 1)
      population.size.should eq 1

      population = ConwayGameOfLife::Population.new(width: 2, length: 2)
      population.size.should eq 4

      population = ConwayGameOfLife::Population.new(width: 2, length: 3)
      population.size.should eq 6
    end
  end

  describe "#find_cell" do
    it "finds cells in the given population" do
      population = ConwayGameOfLife::Population.new(width: 2, length: 2)
      population.find_cell(x: 0, y: 0).should eq population.cells[0]
      population.find_cell(x: 0, y: 1).should eq population.cells[1]
      population.find_cell(x: 1, y: 0).should eq population.cells[2]
      population.find_cell(x: 1, y: 1).should eq population.cells[3]
    end
  end

  describe "#next_generation!" do
    it "kills all its cells" do
      population = ConwayGameOfLife::Population.new(width: 2, length: 2)

      cell = population.find_cell(x: 0, y: 0)
      cell.alive!

      another_cell = population.find_cell(x: 0, y: 1)
      another_cell.alive!

      population.next_generation!

      cell.dead?.should be_true
      another_cell.dead?.should be_true
    end
  end
end
