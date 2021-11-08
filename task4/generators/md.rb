require_relative './base'

class GeneratorMd < GeneratorBase
  def apply_mapping line
    if line.is_a? Header
      "# #{line.text}"
    elsif line.is_a? Section
      "# #{line.title} \n#{line.text}"
    elsif line.is_a? Text
      line.text
    elsif line.is_a? Link
      %Q{[#{line.text}](#{line.url})}
    elsif line.is_a? Image
      %Q{![#{line.alt}](#{line.url})}
    else
      "UNKNOWN"
    end
  end
end
