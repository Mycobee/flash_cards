require 'minitest/autorun'
require 'minitest/pride'
require "pry"
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class TurnTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]
    @turn = Turn.new("Juneau", @card_1)
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_that_round_has_deck
    assert_equal @deck, @round.deck
  end

  def test_that_round_has_turns
    assert_equal [], @round.turns
  end

  def test_that_round_has_correct_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_the_take_turn_method
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
  end

  def test_the_take_turn_array_iteration
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.turns.length
  end

  def test_the_turn_is_proper_class
    new_turn = @round.take_turn("Juneau")
    assert_equal Turn, new_turn.class
  end

  def test_new_turn_is_correct
    new_turn = @round.take_turn("Juneau")
    assert_equal true, new_turn.correct?
  end

  def test_take_turns_function
    new_turn = @round.take_turn("Juneau")
    assert_equal [new_turn], @round.turns
  end

  def test_number_correct_method
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_percent_correct
    new_turn = @round.take_turn("Juneau")
    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    new_turn = @round.take_turn("Juneau")
  end

end
