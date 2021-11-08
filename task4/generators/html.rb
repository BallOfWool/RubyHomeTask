require_relative './base'

class GeneratorHtml < GeneratorBase
  def apply_mapping line
    if line.is_a? Header
      "<h1> #{line.text} </h1>?"
    elsif line.is_a? Section
      "<h1> #{line.title} <h1>
      <p> #{line.text} </p>"
    elsif line.is_a? Text
      "<p> #{line.text} </p>"
    elsif line.is_a? Link
      %Q{<a href=#{line.url}>#{line.text}</a>}
    elsif line.is_a? Image
      %Q{<img src="#{line.url}" alt="#{line.alt}}
    else
      "UNKNOWN"
    end
  end
end
