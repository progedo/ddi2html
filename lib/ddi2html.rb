require 'xmlhasher'

def ddi2html xml_to_parse
  xml = XmlHasher.parse(xml_to_parse)
  html = "<body>\n"
  html.concat "  <div class=\"dataDscr\">\n"
  html.concat "    <div class=\"varGrp\">\n"
  html.concat "      "
  html.concat xml[:codeBook][:dataDscr][:varGrp][:labl].strip
  html.concat "\n"
  html.concat "    </div>\n"
  html.concat "  </div>\n"
  html.concat "</body>"
end
