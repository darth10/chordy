# encoding: utf-8

module Tuning
  def is_tuning? tuning
    Tuning.instance_methods.include? tuning.to_s
    true
  end

  def tuning_6_standard
    ["e", "a", "d", "g", "b", "e"]
  end

  def tuning_6_a
    ["a", "d", "g", "c", "e", "a"]
  end

  def tuning_6_b
    ["b", "e", "a", "d", "f#", "b"]
  end

  def tuning_6_c
    ["c", "f", "a#", "d#", "g", "c"]
  end

  def tuning_6_d
    ["d", "g", "c", "f", "a", "d"]
  end

  def tuning_6_drop_a
    ["a", "e", "a", "d", "f#", "b"]
  end

  def tuning_6_drop_c
    ["c", "g", "c", "f", "a", "d"]
  end

  def tuning_6_drop_d
    ["d", "a", "d", "g", "b", "e"]
  end

  def tuning_7_standard
    ["b", "e", "a", "d", "g", "b", "e"]
  end

  def tuning_7_a
    ["a", "d", "g", "c", "f", "a", "d"]
  end

  def tuning_7_a_sharp
    ["a#", "d#", "g#", "c#", "f#", "a#", "d#"]
  end

  def tuning_7_c
    ["c", "f", "a#", "d#", "g#", "c", "f"]
  end

  def tuning_7_d
    ["d", "g", "c", "f", "a#", "d", "g"]
  end

  def tuning_7_drop_a
    ["a", "e", "a", "d", "f#", "b", "e"]
  end

  def tuning_7_drop_g
    ["g", "d", "g", "c", "f", "a", "d"]
  end

  def tuning_7_drop_g_sharp
    ["g#", "d#", "g#", "c#", "f#", "a#", "d#"]
  end

  def tuning_8_standard
    ["f#", "b", "e", "a", "d", "g", "b", "e"]
  end

  def tuning_8_a
    ["a", "d", "g", "c", "f", "a", "d", "g"]
  end

  def tuning_8_e
    ["e", "a", "d", "g", "c", "f", "a", "d"]
  end

  def tuning_8_f
    ["fb", "bb", "eb", "ab", "db", "gb", "bb", "eb"]
  end

  def tuning_8_drop_d_sharp
    ["eb", "bb", "eb", "ab", "db", "gb", "bb", "eb"]
  end

  def tuning_8_drop_e
    ["e", "b", "e", "a", "d", "g", "b", "e"]
  end

  alias :tuning_standard :tuning_6_standard
  alias :tuning_a :tuning_6_a
  alias :tuning_b :tuning_6_b
  alias :tuning_c :tuning_6_c
  alias :tuning_d :tuning_6_d
  alias :tuning_drop_a :tuning_6_drop_a
  alias :tuning_drop_c :tuning_6_drop_c
  alias :tuning_drop_d :tuning_6_drop_d
  alias :tuning_7 :tuning_7_standard
  alias :tuning_7_a! :tuning_7_a_sharp
  alias :tuning_7_drop_g! :tuning_7_drop_g_sharp
  alias :tuning_8_drop_d! :tuning_8_drop_d_sharp
end
