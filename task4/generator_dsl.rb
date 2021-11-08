class GeneratorDsl
  attr_accessor :lines

  def initialize
    @lines = []
  end

  def header str
    @lines << Header.new(str)
  end

  def section header, text
    @lines << Section.new(header, text)
  end

  def text str
    @lines << Text.new(str)
  end

  def link text, url
    @lines << Link.new(text, url)
  end

  def image alt, url
    @lines << Link.new(alt, url)
  end


end
