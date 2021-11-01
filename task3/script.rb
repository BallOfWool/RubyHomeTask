class MDHtml
    def initialize(&block)
      @out = ''
      instance_eval &block
    end
  
    def html(&block)
      @out << "<!doctype html>\n\n"
      @out << "<html>\n"
      instance_eval &block
      @out << "</html>"
  
    end
  
    def head(&block)
      @out << "<head>\n"
      instance_eval &block
      @out << "</head>\n"
    end
  
    def meta(**code)
      @out << %Q{ <meta name="#{code.keys.join}" content="#{code.values.join}">\n}
    end
  
    def title(code)
      @out << " <title>#{code}</title>\n"
    end
  
    def link(**code)
      @out << %Q{\n <link rel="#{code.keys.join}" href="#{code.values.join}">\n}
    end
  
    def body(&block)
      @out << "\n<body>\n"
      instance_eval &block
      @out << "</body>\n"
    end

    def div(&block)
      @out << " <div>"
      @out << block.call()
      @out << "</div>\n"
    end
  
    def script **code
      @out << %Q{ <script #{code.keys.join}="#{code.values.join}"> </ script>\n}
    end
  
    def to_s
      puts @out
    end
  end
  

MDHtml.new do
  html do
    head do
      meta charset: "utf-8"
      title "The HTML5 Template"
      meta description: "The HTML5 Template"
      meta author: "MobiDev"
      link stylesheet: "css/styles.css?v=1.0"
    end


    body do
      div do
        "Hello World"
      end
      script src:"js/scripts.js"
    end
  end
end.to_s