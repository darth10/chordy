# encoding: utf-8

class Section
  attr_accessor :separator_length

  def initialize(title="", separator_length=40)
    @title = title
    @separator_length = separator_length
  end
  
  def to_s
    title_str = @title.to_s
    title_str.rjust(title_str.length + 2, "-").ljust(@separator_length, "-")
  end
end
