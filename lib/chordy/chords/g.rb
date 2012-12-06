# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'chord')

class G < Chord
  def play_major
    [3, 2, 0, 0, 0, 3]
  end

  def play_minor
    [-1, 1, 0, 3, 3, 3]
  end

  def play_dominant_7
    [3, 2, 0, 0, 0, 1]
  end

  def play_dominant_7_5
    [-1, -1, 3, 4, 2, 3]
  end

  def play_major_6
    [3, 2, 0, 0, 0, 0]
  end

  def play_major_7
    [3, 2, 0, 0, 0, 2]
  end

  def play_major_9
    [0, 0, 0, 0, 0, 1]
  end

  def play_minor_6
    [0, 1, 0, 0, 3, 0]
  end

  def play_minor_7
    [3, 5, 3, 3, 3, 3]
  end

  def play_half_diminished_7
    [3, 4, 3, 3, 6, 3]
  end

  def play_minor_major_7
    [3, 5, 4, 3, 3, 3]
  end

  def play_augmented_5
    [3, 2, 1, 0, 0, 3]
  end

  def play_augmented_7
    [3, 2, 1, 0, 0, 1]
  end

  def play_augmented_major_7
    [3, 2, 1, 0, 0, 3]
  end

  def play_diminished_5
    [3, 4, 0, 3, 2, 3]
  end

  def play_diminished_7
    [0, 1, 2, 0, 2, 0]
  end

  def play_diminished_9
    [-1, 2, 3, 1, 0, 3]
  end

  def play_suspended_4
    [3, 3, 0, 0, 1, 3]
  end

  def play_suspended_7
    [3, 3, 0, 0, 1, 1]
  end
end
