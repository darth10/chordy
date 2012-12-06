# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'chord')

class FSharp < Chord
  def play_major
    [2, 4, 4, 3, 2, 2]
  end

  def play_minor
    [2, 4, 4, 2, 2, 2]
  end

  def play_dominant_7
    [2, 4, 2, 3, 2, 2]
  end

  def play_dominant_7_5
    [-1, -1, 2, 3, 1, 2]
  end

  def play_major_6
    [-1, 4, 4, 6, 4, 6]
  end

  def play_major_7
    [2, 4, 3, 3, 2, 2]
  end

  def play_major_9
    [2, 4, 2, 3, 2, 4]
  end

  def play_minor_6
    [-1, 4, 4, 6, 4, 5]
  end

  def play_minor_7
    [2, 4, 2, 2, 2, 2]
  end

  def play_half_diminished_7
    [2, 3, 2, 2, 5, 2]
  end

  def play_minor_major_7
    [2, 4, 3, 2, 2, 2]
  end

  def play_augmented_5
    [2, -1, 4, 3, 3, 2]
  end

  def play_augmented_7
    [2, 4, 2, 3, 3, 2]
  end

  def play_augmented_major_7
    [-1, -1, 3, 3, 3, 2]
  end

  def play_diminished_5
    [2, 0, 4, 2, 1, 2]
  end

  def play_diminished_7
    [2, 3, 4, 2, 4, 2]
  end

  def play_diminished_9
    [2, 4, 2, 3, 2, 3]
  end

  def play_suspended_4
    [2, 2, 4, 4, 2, 2]
  end

  def play_suspended_7
    [2, 4, 2, 4, 2, 2]
  end
end

GFlat = FSharp
