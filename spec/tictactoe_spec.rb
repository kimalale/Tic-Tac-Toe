require './lib/tictactoe'

describe Game do

  describe '#initialize' do



  context 'when using default initialization' do
    subject(:tac_game) { described_class.new }
    it 'is player X' do
      expect(tac_game.current_player).to eq('X')
    end
  end

  context 'when plays is 9' do
    subject(:tac_game) { described_class.new }
    it 'is 9' do
      expect(tac_game.plays).to eq(9)
    end
  end
end

describe '#make_move' do
  context 'when selecting a grid to make a move' do


    context 'when selecting a filled block' do
      subject(:tac_game) { described_class.new }



      it 'it output error' do
        tac_game.make_move(0, 0)
        error_message = "\nWarning, the slot: [0,0] has already be used!"
        expect(tac_game.make_move(0, 0)).not_to receive(:puts).with(error_message)

      end
      it 'it is output error' do
        tac_game.make_move(0, 0)
        error_message = "\nWarning, the slot: [0,0] has already be used!"
        expect(tac_game.make_move(0, 0)).not_to receive(:puts).with(error_message)

      end
    end

  end
end
end

# # ASSIGNMENT

# describe Drink do
# describe '#initialize' do
#   context 'when type is specified and ounces is default' do
#     # Create an explicit subject, using 'described_class' and your choice of
#     # beverage type.
#     subject(:tea) { described_class.new("tea")}

#     # remove the 'x' before running this test
#     it 'is your choice of beverage' do
#       expect(tea.type).to eq("tea")
#     end

#     # remove the 'x' before running this test
#     it 'has 16 ounces' do
#       expect(tea.ounces).to eq(16)
#     end
#   end
# end

# describe '#full?' do
#   context 'when drink has 16 ounces or more' do
#     # Create an explicit subject, using 'described_class' and your choice of
#     # beverage type.
#     subject(:water) { described_class.new('spring')}
#     # remove the 'x' before running this test
#     it 'is full' do
#       expect(water).to be_full
#     end
#   end

#   context 'when drink has less than 16 ounces' do
#     # Create an explicit subject, using 'described_class' and your choice of
#     # beverage type. In addition, specify ounces to be any number under 16.
#     subject(:milk) { described_class.new('full cream', 12)}

#     # remove the 'x' before running this test
#     it 'is not full' do
#       expect(milk).not_to be_full
#     end
#   end
# end
# end


