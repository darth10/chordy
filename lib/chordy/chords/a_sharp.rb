# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'chord')

class ASharp < Chord
  def play_major
    [1, 1, 3, 3, 3, 1]
  end

  def play_minor
    [1, 1, 3, 3, 2, 1]
  end

  def play_dominant_7
    [1, 1, 3, 1, 3, 1]
  end

  def play_dominant_7_5
    [0, 1, 2, 1, 3, 4]
  end
  
  def play_major_6
    [1, 1, 3, 3, 3, 3]
  end

  def play_major_7
    [1, 1, 3, 2, 3, 1]
  end

  def play_major_9
    [-1, 1, 0, 1, 1, 1]
  end

  def play_minor_6
    [-1, -1, 3, 3, 2, 3]
  end

  def play_minor_7
    [1, 1, 3, 1, 2, 1]
  end
  
  def play_half_diminished_7
    [1, 1, 2, 1, 2, 4]
  end

  def play_minor_major_7
    [1, 1, 3, 2, 2, 1]
  end

  def play_augmented_5
    [2, -1, 4, 3, 3, 2]
  end

  def play_augmented_7
    [-1, 1, 4, 1, 3, 2]
  end

  def play_augmented_major_7
    [-1, 1, 0, 2, 3, 2]
  end

  def play_diminished_5
    [0, 1, 2, 3, 2, 0]
  end

  def play_diminished_7
    [-1, -1, 2, 3, 2, 3]
  end

  def play_diminished_9
    [1, 1, 0, 1, 0, 1]
  end

  def play_suspended_4
    [1, 1, 1, 3, 4, 1]
  end

  def play_suspended_7
    [1, 1, 1, 1, 3, 1]
  end
end

BFlat = ASharp
