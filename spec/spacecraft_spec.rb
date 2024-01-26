require_relative '../spacecraft.rb'

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

    context 'angle changes' do
      it 'should turn upward from North to Up' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['u'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, 0, 0])
      end

      it 'should turn upward from South to Up' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['l', 'l', 'u'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, 0, 0])
      end

      it 'should turn upward from East to Up' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['r', 'u'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, 0, 0])
      end

      it 'should move forward and turn up' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['f', 'u'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, 1, 0])
      end

      it 'should move backward and turn up' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['b', 'u'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, -1, 0])
      end

      it 'should turn downward from North to Down' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['d'])
        expect(spacecraft.direction).to eq('Down')
        expect(spacecraft.position).to eq([0, 0, 0])
      end

      it 'should turn downward from South to Down' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['r', 'r', 'd'])
        expect(spacecraft.direction).to eq('Down')
        expect(spacecraft.position).to eq([0, 0, 0])
      end

      it 'should turn downward from East to Down' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['r', 'd'])
        expect(spacecraft.direction).to eq('Down')
        expect(spacecraft.position).to eq([0, 0, 0])
      end

      it 'should move forward and turn down' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['f', 'd'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, 1, 0])
      end

      it 'should move backward and turn down' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['b', 'd'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, -1, 0])
      end
    end

    context 'motion in all axis' do
      it 'should move forward in east direction while facing upward' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['r', 'u', 'f'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, 0, 1])
      end

      it 'should move backward in west direction while facing up' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['l', 'u', 'b'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([0, 0, -1])
      end

      it 'should move forward in west direction and facing up' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['l', 'f', 'u'])
        expect(spacecraft.direction).to eq('Up')
        expect(spacecraft.position).to eq([-1, 0, 0])
      end

      it 'should move backward in North direction and facing down' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['b', 'd'])
        expect(spacecraft.direction).to eq('Down')
        expect(spacecraft.position).to eq([0, -1, 0])
      end

      it 'should move forward in west direction' do
        spacecraft = Spacecraft.new
        spacecraft.execute_commands(['l', 'f'])
        expect(spacecraft.direction).to eq('W')
        expect(spacecraft.position).to eq([-1, 0, 0])
      end
    end
  end
end
