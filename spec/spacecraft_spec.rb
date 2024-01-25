RSpec.describe Spacecraft do

  describe '#spacecraft' do
    context 'movement' do
      
      it 'should move forward in the North direction' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['f'])
        expect(spacecraft.position).to eq([0, 1, 0])
      end

      it 'should move backward in the South direction' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['b'])
        expect(spacecraft.position).to eq([0, -1, 0])
      end

      it 'should move forward and backward multiple steps' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['f', 'f', 'b', 'b'])
        expect(spacecraft.position).to eq([0, 0, 0])
      end
    end
  end
end
