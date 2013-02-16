includes = ['chords', 'util']

include_dirs = includes.map { |dir| "chordy/#{dir}/" }
include_dirs.each do |dir|
  Dir[File.join(File.dirname(__FILE__), dir + '**.rb')].each do |file|
    require file
  end
end

module Chordy
  extend self, Util, Util::Tuning

  attr_accessor :chords, :line_length, :separator_length, :tuning, :auto, :low_to_high
  attr_accessor :chord_space, :half_length_delimiter, :start_delimiter, :end_delimiter

  @line_length = 8
  @separator_length = 40
  @chords = []
  @auto = true
  @tuning = tuning_6_standard
  @low_to_high = false

  # printing delimiters
  @chord_space = "-"
  @half_length_delimiter = "|"
  @start_delimiter = "["
  @end_delimiter = "]"

  def do_auto a=true
    Chordy.auto = a
    Chordy.auto
  end

  def no_auto
    Chordy.auto = false
    Chordy.auto
  end

  def do_low_to_high
    Chordy.low_to_high = true
    do_print
  end

  def do_high_to_low
    Chordy.low_to_high = false
    do_print
  end

  def set_line_length a
    if a.instance_of? Fixnum
      Chordy.line_length = a
      do_print
    else
      puts "Invalid length"
    end
  end

  def clear
    Chordy.chords = []
    do_print
  end

  # TODO document + examples

  def set_chords_to_tuning tuning
    longest_tuning_str_length = tuning.max.length
    Chordy.tuning = tuning.map { |e| e.rjust(longest_tuning_str_length) }

    Chordy.chords.select { |c| c.is_a? Chord } .each { |e| e.pad_or_trim Chordy.tuning.length, true }
  end

  def tune new_tuning, direction=:low_to_high
    to_do_print = false
    strings = [6, 7, 8]

    if new_tuning.is_a? Array
      if strings.include? new_tuning.length
        if direction == :high_to_low
          new_tuning = new_tuning.reverse
        end

        set_chords_to_tuning new_tuning
        to_do_print = true
      else
        puts "Invalid tuning; only " + strings.join(",") + " strings are allowed"
      end
    else
      if is_tuning? new_tuning.to_s
        new_tuning = eval("#{new_tuning}")
        set_chords_to_tuning new_tuning
        to_do_print = true
      else
        puts "Unknown or invalid tuning"
      end
    end

    if to_do_print
      do_print
    end
  end

  def check_sharp_or_flat_chord chord_name
    chord = chord_name.capitalize
    sharp_re = /!$/
    flat_re = /_$/

    if sharp_re =~ chord
      chord = chord.gsub(sharp_re, "Sharp")
    elsif flat_re =~ chord
      chord = chord.gsub(flat_re, "Flat")
    end

    chord
  end

  def check_chord_class chord_name
    eval("defined?(#{chord_name}) == 'constant' and #{chord_name}.class == Class")
  end

  def play chords, chord_type_or_direction=:major
    chord = nil
    begin
      if chords.instance_of? Array
        chord = Chord.new(chords, Chordy.tuning.length)

        # play high-to-low, unless :low_to_high is specified
        if chord_type_or_direction != :low_to_high
          chord.reverse_strings!
        end
      else
        chord_name = chords.to_s
        if !check_chord_class chord_name
          chord_name = check_sharp_or_flat_chord chord_name
        end

        chord_init = "#{chord_name}.new :#{chord_type_or_direction}, #{Chordy.tuning.length}"
        chord = eval(chord_init)
      end

      Chordy.chords.push chord
      do_print
    rescue NameError => ne
      puts "Unknown chord or chord type"
      puts ne.message
      puts ne.backtrace
    rescue Exception => e
      puts e.class.to_s
      puts e.message
      puts e.backtrace
    end

    chord
  end

  def text text
    Chordy.chords.push Util::Text.new(text)
    do_print
  end

  def section title=""
    Chordy.chords.push Util::Section.new(title, Chordy.separator_length)
    do_print
  end

  def separator
    section
  end

  def do_print
    if Chordy.auto
      print_chords
    end
  end

  def print_chords
    lines_to_print = []
    chord_index = 0
    chords_in_section = 0
    tuning_length = Chordy.tuning.length
    is_done = false
    is_new_line = true
    is_even_line_length = (Chordy.line_length % 2) == 0
    is_next_chord_section_or_text = false
    to_print_start_chords = false
    to_skip_end_strings = false

    chords = Chordy.chords.to_a
    chords.select { |c| c.is_a? Util::Section } .map { |s| s.separator_length = Chordy.separator_length }

    while !is_done
      if is_new_line or to_print_start_chords
        if chords[chord_index].is_a? Chord
          start_strings = Chord.start_of_strings Chordy.tuning, Chordy.start_delimiter, Chordy.low_to_high

          start_strings.each { |s| lines_to_print.push s }
        end
        to_print_start_chords = false
        is_new_line = false
      end

      last_chord_lines = lines_to_print.last(tuning_length + 1)
      curr_chord = chords[chord_index]
      if curr_chord.is_a? Chord
        last_chord_lines.each_with_index do |line, i|
          if i == tuning_length
            line << curr_chord.print_flag
          else
            line << curr_chord.print_string_at(i, Chordy.chord_space, Chordy.low_to_high)
          end
        end

        chords_in_section = chords_in_section + 1
        to_skip_end_strings = false
      elsif (chords[chord_index].is_a? Util::Text) or (chords[chord_index].is_a? Util::Section)
        lines_to_print.push chords[chord_index].to_s
        to_skip_end_strings = true
        chords_in_section = 0

        if chords[chord_index + 1].is_a? Chord
          to_print_start_chords = true
        end
      end

      chord_index = chord_index + 1
      if (chords[chord_index].is_a? Util::Text) or (chords[chord_index].is_a? Util::Section)
        is_next_chord_section_or_text = true
      else
        is_next_chord_section_or_text = false
      end

      if ((chords_in_section % Chordy.line_length) == 0) or (chord_index == chords.length) or is_next_chord_section_or_text
        if to_skip_end_strings
          to_skip_end_strings = false
        else
          end_strings = Chord.end_of_strings Chordy.tuning, Chordy.end_delimiter
          last_chord_lines.each_with_index do |line, i|
            line << end_strings[i]
          end
        end

        # start the next actual line
        lines_to_print.push ""
        is_new_line = true
      elsif (chords_in_section % Chordy.line_length) == (Chordy.line_length / 2) and is_even_line_length
        last_chord_lines.each_with_index do |line, i|
          line << Chord.print_half_length_string_at(i, Chordy.tuning, Chordy.half_length_delimiter, Chordy.chord_space)
        end
      end

      if is_next_chord_section_or_text
        is_new_line = false
      end

      if chord_index >= chords.length
        is_done = true
      end
    end

    # print the buffer
    lines_to_print.each { |l| puts l }
    nil
  end

  Chord::CHORD_FLAGS.each_with_index do |name,i|
    eval <<-ENDOFEVAL
    def #{name}
      saved_auto = Chordy.auto
      saved_chord_index = Chordy.chords.length
      Chordy.auto = false
      begin
        chord = yield if block_given?

        num_new_chords = Chordy.chords.length - saved_chord_index
        Chordy.chords.last(num_new_chords).each { |c| c.send :#{name} }
      rescue Exception => e
        puts e.class.to_s
        puts e.message
        puts e.backtrace
      end

      Chordy.auto = saved_auto
      do_print
      chord
    end
    ENDOFEVAL

    if name != "dont_play"
      eval <<-ENDOFEVAL
      def play_#{name} chords, chord_type_or_direction=:major
        #{name} { play chords, chord_type_or_direction }
      end
      ENDOFEVAL
    end
  end

  Chord.short_chords.values.each do |s|
    short_chord_name = s.to_s
    eval <<-ENDOFEVAL
      def #{short_chord_name}
        :#{s}
      end
      ENDOFEVAL
  end
end

include Chordy
