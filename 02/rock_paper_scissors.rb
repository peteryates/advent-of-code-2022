# frozen_string_literal: true
require "pry"

class RockPaperScissors
  attr_reader :games

  def initialize(input, part: 1)
    if part == 1
      @games = input
        .split("\n")
        .map { |line| RoundPart1.new(*line.split(" ")) }
    else
      @games = input
        .split("\n")
        .map { |line| RoundPart2.new(*line.split(" ")) }
    end
  end

  def score
    games.map(&:score).sum
  end

  class RoundPart1
    RESPONSE_SCORES = { 🪨: 1, 📃: 2, ✂️: 3 }.freeze
    THEM = { 'A' => :🪨, 'B' => :📃, 'C' => :✂️ }.freeze
    US = { 'X' => :🪨, 'Y' => :📃, 'Z' => :✂️ }.freeze

    attr_reader :score

    def initialize(them, us)
      @score = decide(THEM.fetch(them), US.fetch(us))
    end

    def decide(them, us)
      rs = RESPONSE_SCORES.fetch(us)

      if them == us
        return 3 + rs
      elsif them == :🪨
        return 6 + rs if us == :📃
        return 0 + rs if us == :✂️
        fail
      elsif them == :📃
        return 6 + rs if us == :✂️
        return 0 + rs if us == :🪨
        fail
      elsif them == :✂️
        return 6 + rs if us == :🪨
        return 0 + rs if us == :📃
        fail
      else
        fail
      end
    end
  end

  class RoundPart2
    RESPONSE_SCORES = { 🪨: 1, 📃: 2, ✂️: 3 }.freeze
    THEM = { 'A' => :🪨, 'B' => :📃, 'C' => :✂️ }.freeze
    OUTCOMES = { 'X' => :lose, 'Y' => :draw, 'Z' => :win }.freeze

    attr_reader :score

    def initialize(them, outcome)
      @score = decide(THEM.fetch(them), OUTCOMES.fetch(outcome))
    end

    def decide(them, outcome)
      if outcome == :draw
        return 3 + RESPONSE_SCORES.fetch(them)
      elsif them == :🪨
        return 6 + RESPONSE_SCORES.fetch(:📃) if outcome == :win
        return 0 + RESPONSE_SCORES.fetch(:✂️) if outcome == :lose
      elsif them == :📃
        return 6 + RESPONSE_SCORES.fetch(:✂️) if outcome == :win
        return 0 + RESPONSE_SCORES.fetch(:🪨) if outcome == :lose
      elsif them == :✂️
        return 6 + RESPONSE_SCORES.fetch(:🪨) if outcome == :win
        return 0 + RESPONSE_SCORES.fetch(:📃) if outcome == :lose
      end
    end
  end
end
