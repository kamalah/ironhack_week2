require_relative "../ruby_files/cell.rb"

RSpec.describe Cell do 
  describe '#regenerate' do
      it "regenerates a live cell from a live cell if it has 2 neighbours" do
        cell1 = Cell.new(1, [0,0,0,0,0,0,1,1])
        expect(cell1.regenerate).to eq(1)
      end
  

      it "regenerates a dead cell from a dead cell if it has 0 neighbours" do
        cell1 = Cell.new(0, [0,0,0,0,0,0,0,0])
        expect(cell1.regenerate).to eq(0)
      end

      it "kills a live cell if it has <2 neighbours, 1 case" do
        cell1 = Cell.new(1, [1,0,0,0,0,0,0,0])
        expect(cell1.regenerate).to eq(0)
      end

      it "kills a live cell if it has <2 neighbours, 0 case" do
        cell1 = Cell.new(1, [0,0,0,0,0,0,0,0])
        expect(cell1.regenerate).to eq(0)
      end

      it "maintains a live cell if it has 3 neighbours" do
        cell1 = Cell.new(1, [1,0,1,0,1,0,0,0])
        expect(cell1.regenerate).to eq(1)
      end

      it "kills a live cell if it has >3 neighbours, 4 case" do
        cell1 = Cell.new(1, [0,1,0,1,0,1,0,1])
        expect(cell1.regenerate).to eq(0)
      end

      it "makes a live cell if it has exactly 3 neighbours" do
        cell1 = Cell.new(0, [0,0,0,1,0,1,0,1])
        expect(cell1.regenerate).to eq(1)
      end

  end
end