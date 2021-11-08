# frozen_string_literal: true

require_relative './generator_dsl'
require_relative './generators/md'
require_relative './generators/html'
require 'fileutils'


class Generator
  def initialize(&block)
    @dsl = GeneratorDsl.new
    @dsl.instance_eval(&block)
  end

  def generate(path, format)
    path_to = path.split('/')[0...-1].join("/")
    if path_to.length == 0
      path_to='./'
    end
    class_name = "Generator#{format.capitalize}"
    klass = Object.const_get(class_name)
    generator = klass.new(@dsl.lines)
    FileUtils.mkdir_p path_to
    File.open("#{path}.#{format}", "w+") << generator.to_s
  end
end
