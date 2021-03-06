require 'minitest/autorun'
require 'minitest/pride'
require "pry"
require './lib/turn'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end



  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_which_cards_are_in_the_deck
    assert_equal @cards.first, @deck.cards.first
  end

  def test_how_many_cards_are_in_the_deck
    assert_equal @deck.cards.length, @deck.count
  end

  def test_the_cards_category

    actual = @deck.cards_in_category(:STEM)
    assert_equal [@card_2, @card_3], actual

  end
end
