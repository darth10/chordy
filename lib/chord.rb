# encoding: utf-8

class Chord
  CHORD_FLAGS = %w(mute harmonic bend pull hammer_down slide_down slide_up dont_play vibrato)

  def self.all_flags
    CHORD_FLAGS.to_a
  end
  
  def self.start_of_strings tuning, start_delimiter
    num_strings = tuning.length
    (0...num_strings).map { |s| tuning[s].rjust(2) + start_delimiter.rjust(2) } + [ " " * 4 ]
  end
  
  def self.end_of_strings tuning, end_delimiter
    num_strings = tuning.length
    ([ end_delimiter ] * num_strings) + [ "" ]
  end

  def self.print_half_length_string_at string_pos, tuning, half_length_delimiter, chord_space
    if string_pos == tuning.length
      "".rjust(2)
    else
      half_length_delimiter.rjust(2, chord_space)
    end
  end

  def self.short_chords
    {
      :M => :major,
      :m => :minor,
      :_7 => :dominant_7,
      :_7_5 => :dominant_7_5,
      :_9 => :diminished_9,
      :M6 => :major_6,
      :M7 => :major_7,
      :M9 => :major_9,
      :m5 => :diminished_5,
      :m6 => :minor_6,
      :m7 => :minor_7,
      :m7_5 => :half_diminished_7,
      :mM7 => :minor_major_7,
      :aug5 => :augmented_5,
      :aug7 => :augmented_7,
      :aug7_5 => :augmented_major_7,
      :dim => :diminished_7,
      :dim7 => :diminished_7,
      :dim5 => :diminished_5,
      :dim9 => :diminished_9,
      :sus => :suspended_4,
      :sus4 => :suspended_4,
      :sus7 => :suspended_7,
    }
  end
  
  def initialize chord, strings
    @strings = [-1] * strings
    pad_low = false
    if chord.instance_of? String or chord.instance_of? Symbol
      short_chords = Chord.short_chords
      if short_chords.key? chord
        chord_strings = play short_chords[chord]
        @type = short_chords[chord]
      else
        chord_strings = play chord.to_sym
        @type = chord.to_sym
      end
      pad_low = true
    elsif chord.instance_of? Array
      chord_strings = chord.to_a
    end

    @strings = chord_strings
    pad_or_trim strings, pad_low
    @flags = 0
  end
  
  def pad_or_trim length, pad_low
    if @strings.length > length
      @strings = @strings.last length
    elsif @strings.length < length
      diff = length - @strings.length
      if pad_low
        first = @strings.first
        min = @strings.min
        
        # play as bar chord
        bar_chord_string = ((first == min) and (min > 0) and (first > 0)) ? first : -1
        @strings = ([bar_chord_string] * diff) + @strings
      else
        @strings = @strings + [-1] * diff
      end

      self
    end
  end

  def play chord_type
    method_for_chord_type = "play_" + chord_type.to_s
    chord = eval(method_for_chord_type)
    chord
  end

  def strings
    @strings
  end

  def flags
    @flags
  end

  def has_flag flag
    (@flags & flag) == flag
  end

  def add_flag flag
    @flags = @flags | flag
    self
  end

  def print_string_at i, chord_space
    to_print = chord_space
    string = @strings[i]
    if string != -1
      to_print = string.to_s
    end

    to_print = to_print.rjust(3, chord_space)
   
    if @flags != 0
      to_print = print_string_with_flag_at i, to_print, chord_space
    end
    
    to_print.ljust(4, chord_space)
  end

  def print_string_with_flag_at i, printed_string, chord_space
    to_print = printed_string
    string = @strings[i]

    if string != -1
      if has_flag DONT_PLAY
        to_print = "x".rjust(3, chord_space)
      elsif has_flag BEND
        to_print = to_print + "b"
      elsif has_flag HAMMER_DOWN
        to_print = to_print + "h"
      elsif has_flag PULL
        to_print = to_print + "p"
      elsif has_flag SLIDE_UP
        to_print = to_print + "/"
      elsif has_flag SLIDE_DOWN
        to_print = to_print + "\\"
      elsif has_flag VIBRATO
        to_print = to_print + "~"
      end
    end

    to_print
  end

  # for printing flags on diff line
  def print_flag 
    to_print = ""

    if has_flag MUTE
      to_print = "M"
    elsif has_flag HARMONIC
      to_print = "H"
    end

    to_print.rjust(3).ljust(4)
  end 
end

Chord::CHORD_FLAGS.each_with_index do |name,i|
  Chord.class_eval <<-ENDOFEVAL
    #{name.upcase} = #{2**i}
    private 
    def #{name}()
      add_flag #{name.upcase}
    end
    ENDOFEVAL
end

Chord.short_chords.values.each do |chord_type|
  chord_type_str = chord_type.to_s
  Chord.class_eval <<-ENDOFEVAL
     def play_#{chord_type_str}
       [-1] * 6
     end
     ENDOFEVAL
end
