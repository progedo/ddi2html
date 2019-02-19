require './lib/ddi2html'

describe 'ddi2html' do
  it 'Change labl into div' do
    ddi = <<-EOT
        <varGrp ID="VG1" type="subject" varGrp="VG2 VG3 VG4 VG5 VG6 VG7 VG8">
          <labl>
            Fichier Logements
          </labl>
        </varGrp>
        EOT
    expected = <<-EOT
    <div class="varGrp">
      Fichier Logements
    </div>
    EOT
    expect(ddi2html(dataDscr(ddi))).to eq(bodyHtml(expected))
  end
end

def dataDscr xml
  result = "<codeBook version=''>\n"
  result.concat "  <dataDscr>\n"
  result.concat xml
  result.concat "  </dataDscr>\n"
  result.concat "</codeBook>"
end

def bodyHtml html
  result = "<body>\n"
  result.concat "  <div class=\"dataDscr\">\n"
  result.concat html
  result.concat "  </div>\n"
  result.concat "</body>"
end
