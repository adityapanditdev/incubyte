RSpec.describe Spacecraft do

  describe '#spacecraft' do
    context 'movement' do
      
      it 'should move forward in the North direction' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['f'])
        expect(spacecraft.position).to eq([0, 1, 0])
        expect(spacecraft.direction).to eq('N')
      end

      it 'should move backward in the South direction' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['b'])
        expect(spacecraft.position).to eq([0, -1, 0])
        expect(spacecraft.direction).to eq('N') 
      end

      it 'should move forward and backward multiple steps' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['f', 'f', 'b', 'b'])
        expect(spacecraft.position).to eq([0, 0, 0])
        expect(spacecraft.direction).to eq('N')
      end
    end
    
    context 'rotation' do
      it 'should turns left from North to West' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['l'])
        expect(spacecraft.position).to eq([0, 0, 0])
        expect(spacecraft.direction).to eq('W')
      end

      it 'should turns right from North to East' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['r'])
        expect(spacecraft.position).to eq([0, 0, 0])
        expect(spacecraft.direction).to eq('E')
      end

      it 'should turns left multiple times' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['l', 'l'])
        expect(spacecraft.position).to eq([0, 0, 0])
        expect(spacecraft.direction).to eq('S')
      end

      it 'should turns right multiple times' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['r', 'r', 'r'])
        expect(spacecraft.position).to eq([0, 0, 0])
        expect(spacecraft.direction).to eq('W')
      end
    end
  end
end
