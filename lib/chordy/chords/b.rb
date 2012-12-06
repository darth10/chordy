# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'chord')

class B < Chord
  def play_major
    [2, 2, 4, 4, 4, 2]
  end

  def play_minor
    [2, 2, 4, 4, 3, 2]
  end

  def play_dominant_7
    [2, 2, 4, 2, 4, 2]
  end

  def play_dominant_7_5
    [-1, 2, 1, 2, 0, 1]
  end

  def play_major_6
    [2, 2, 4, 4, 4, 4]
  end

  def play_major_7
    [2, 2, 4, 3, 4, 2]
  end

  def play_major_9
    [-1, 2, 1, 2, 2, 2]
  end

  def play_minor_6
    [-1, 2, 0, 1, 3, 2]
  end

  def play_minor_7
    [-1, 2, 0, 2, 0, 2]
  end

  def play_half_diminished_7
    [1, 0, 0, 2, 0, 1]
  end

  def play_minor_major_7
    [2, 2, 4, 3, 3, 2]
  end

  def play_augmented_5
    [3, -1, 5, 4, 4, 3]
  end

  def play_augmented_7
    [-1, 2, 1, 2, 0, 3]
  end

  def play_augmented_major_7
    [-1, 2, -1, 3, 4, 3]
  end

  def play_diminished_5
    [1, -1, 3, 4, 3, 1]
  end

  def play_diminished_7
    [-1, -1, 0, 1, 0, 1]
  end

  def play_diminished_9
    [-1, 2, 1, 2, 1, 2]
  end

  def play_suspended_4
    [2, 2, 4, 4, 5, 2]
  end

  def play_suspended_7
    [2, 2, 2, 2, 5, 2]
  end
end
