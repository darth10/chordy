# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'chord')

class CSharp < Chord
  def play_major
    [1, 4, 3, 1, 2, 1]
  end

  def play_minor
    [0, -1, 2, 1, 2, 4]
  end

  def play_dominant_7
    [1, 2, 3, 1, 2, 1]
  end

  def play_dominant_7_5
    [-1, 2, 3, 4, 2, 3]
  end
  
  def play_major_6
    [1, 1, 3, 1, 2, 1]
  end

  def play_major_7
    [1, 4, 3, 1, 1, 1]
  end

  def play_major_9
    [1, 2, 1, 1, 2, 1]
  end

  def play_minor_6
    [0, 4, 2, 3, 2, 4]
  end

  def play_minor_7
    [0, 2, 2, 4, 2, 4]
  end
  
  def play_half_diminished_7
    [0, 2, 2, 4, 2, 3]
  end

  def play_minor_major_7
    [0, 3, 2, 1, 1, 4]
  end

  def play_augmented_5
    [-1, 0, 3, 2, 2, 1]
  end

  def play_augmented_7
    [-1, 2, 3, 4, 2, 5]
  end
  
  def play_augmented_major_7
    [1, 4, 3, 2, 1, 1]
  end

  def play_diminished_5
    [0, -1, 2, 0, 2, 3]
  end

  def play_diminished_7
    [-1, -1, 2, 3, 2, 3]
  end

  def play_diminished_9
    [-1, 4, 3, 4, 3, 4]
  end

  def play_suspended_4
    [4, 4, 6, 6, 7, 4]
  end

  def play_suspended_7
    [2, 2, 4, 4, 2, 2]
  end
end

DFlat = CSharp
