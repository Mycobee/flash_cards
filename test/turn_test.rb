require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'


class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end


  def test_it_exists
    assert_instance_of Turn, @turn
  end


  def test_there_is_a_guess
     assert_equal "Juneau", @turn.guess
  end

  def test_the_card
    assert_equal @card, @turn.card
  end

  def test_if_guess_is_correct
      assert_equal true, @turn.correct?
  end


  def test_the_feedback
     assert_equal "Correct!", @turn.feedback
     turn = Turn.new("F", @card)
     assert_equal "Incorrect.", turn.feedback
  end


end
