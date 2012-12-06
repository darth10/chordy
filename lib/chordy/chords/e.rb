# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'chord')

class E < Chord
  def play_major
    [0, 2, 2, 1, 0, 0]
  end

  def play_minor
    [0, 2, 2, 0, 0, 0]
  end

  def play_dominant_7
    [0, 2, 2, 1, 3, 0]
  end

  def play_dominant_7_5
    [-1, -1, 2, 3, 3, 4]
  end

  def play_major_6
    [0, 2, 2, 1, 2, 0]
  end

  def play_major_7
    [0, 2, 1, 1, 0, 0]
  end

  def play_major_9
    [0, 2, 0, 1, 0, 2]
  end

  def play_minor_6
    [0, 2, 2, 0, 2, 0]
  end

  def play_minor_7
    [0, 2, 0, 0, 0, 0]
  end

  def play_half_diminished_7
    [0, 1, 0, 0, 3, 0]
  end

  def play_minor_major_7
    [0, 2, 1, 0, 0, 0]
  end

  def play_augmented_5
    [0, -1, 2, 1, 1, 0]
  end

  def play_augmented_7
    [0, 2, 0, 1, 1, 0]
  end

  def play_augmented_major_7
    [0, -1, 1, 1, 1, 0]
  end

  def play_diminished_5
    [3, -1, 5, 3, 5, 3]
  end

  def play_diminished_7
    [0, 1, 2, 0, 2, 0]
  end

  def play_diminished_9
    [0, 2, 0, 1, 0, 1]
  end

  def play_suspended_4
    [0, 2, 2, 2, 0, 0]
  end

  def play_suspended_7
    [0, 2, 0, 2, 0, 0]
  end
end
