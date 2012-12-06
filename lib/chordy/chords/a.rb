# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'chord')

class A < Chord
  def play_major
    [0, 0, 2, 2, 2, 0]
  end

  def play_minor
    [0, 0, 2, 2, 1, 0]
  end

  def play_dominant_7
    [0, 0, 2, 0, 2, 0]
  end

  def play_dominant_7_5
    [-1, 0, 1, 0, 2, 3]
  end

  def play_major_6
    [0, 0, 2, 2, 2, 2]
  end

  def play_major_7
    [0, 0, 2, 1, 2, 0]
  end

  def play_major_9
    [-1, 2, 2, 2, 2, 3]
  end

  def play_minor_6
    [2, 0, 2, 2, 1, 2]
  end

  def play_minor_7
    [0, 0, 2, 0, 1, 0]
  end

  def play_half_diminished_7
    [-1, 0, 1, 0, 1, 3]
  end

  def play_minor_major_7
    [0, 0, 2, 1, 1, 0]
  end

  def play_augmented_5
    [1, 0, 3, 2, 2, 1]
  end

  def play_augmented_7
    [1, 4, 3, 0, 2, 1]
  end

  def play_augmented_major_7
    [-1, 0, -1, 1, 2, 1]
  end

  def play_diminished_5
    [5, 6, 7, 5, 4, 5]
  end

  def play_diminished_7
    [-1, -1, 1, 2, 1, 2]
  end

  def play_diminished_9
    [2, -1, 5, 3, 2, 5]
  end

  def play_suspended_4
    [0, 0, 2, 2, 3, 0]
  end

  def play_suspended_7
    [0, 0, 2, 0, 3, 0]
  end
end
