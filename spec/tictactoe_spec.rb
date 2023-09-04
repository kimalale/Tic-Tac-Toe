require './lib/tictactoe'

describe Game do

  describe '#initialize' do
    subject(:tac_game) { described_class.new }

    context 'when using default initialization' do
      it 'it starts with player X' do
        expect(tac_game.current_player).to eq('X')
      end
    end

    context 'when plays is initialized' do
      it 'it is 9' do
        expect(tac_game.plays).to eq(9)
      end
    end
  end

  describe '#make_move' do
    subject(:tac_move_game) { described_class.new }

    before do
      tac_move_game.make_move(0, 0)
    end

    context 'when a player is making a move to an occupied slot' do

      it 'it return used slot message' do
        used_slot_message = "\nWarning, the slot: [0,0] has already be used!"
        expect(tac_move_game).to receive(:puts).with(used_slot_message)
        tac_move_game.make_move(0, 0)
      end
    end

    context 'when a player is making an illegal move' do
      it 'it returns out out bounds message' do
        out_of_bounds = "\nWarning, the slot: [0,0] has already be used!"
        expect(tac_move_game).not_to receive(:puts).with(out_of_bounds)
        tac_move_game.make_move(-1, 0)
      end
    end


  end


  describe '#check_win' do
    subject(:tac_win_game) { described_class.new }

    before do
      tac_win_game.make_move(0,0)
      tac_win_game.make_move(0,1)
      tac_win_game.make_move(1,0)
      tac_win_game.make_move(2,2)
      tac_win_game.make_move(2,0)
    end
    context 'when a player lines the symbols' do
      it 'returns winner statement' do
        expect(tac_win_game.check_win).to be_truthy
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


