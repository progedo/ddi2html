require 'xmlhasher_with_attributes'

def ddi2html xml_to_parse
  xml = XmlHasher.parse(xml_to_parse)
  codebook = xml[:codeBook]
  dataDscr = codebook[:dataDscr]
  varGrp = dataDscr[:varGrp]
  vars = dataDscr[:var]
  
  #vars = codebook[:var].first
  html = "<body>\n"
  html.concat "  <div class=\"dataDscr\">\n"
  html.concat "    <div class=\"varGrp\">\n"
  html.concat "      <div class=\"labl\">\n"
  html.concat "        #{varGrp[:labl].strip}\n"
  html.concat "      </div>\n"
  html.concat "    </div>\n"
  html.concat "  </div>\n"
  html.concat "</body>"
end
