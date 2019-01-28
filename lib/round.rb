require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize deck
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    turn =  Turn.new(guess, @current_card)
      @turns << turn
        @deck.cards.shift
      return turn
  end

  def number_correct
    @turns.map do |turn|
        turn.correct?
        @number_correct += 1
      end
    return @number_correct
  end

  def number_correct_by_category(category)
    cat_correct = []
    @turns.each do |turn|
    if turn.card.category == category
      cat_correct << turn
    end
      return cat_correct.count
    end
  end
end
