require './lib/ddi2html'

describe 'ddi2html' do
  it 'Change labl into div' do
    ddi = dataDscr(<<-EOT
        <varGrp ID="VG1" type="subject" varGrp="VG2 VG3 VG4 VG5 VG6 VG7 VG8">
          <labl>
            Fichier Logements
          </labl>
        </varGrp>
        EOT
    )
    expected = <<-EOT
    <div class="varGrp">
      <div class="labl">
        Fichier Logements
      </div>
    </div>
    EOT
    expect(ddi2html(ddi)).to eq(bodyHtml(expected))
  end

  it "A category'd be associated with its group" do
    ddi = dataDscr(<<-EOT
      <varGrp ID="VG2" type="subject" var="V4 V5 V7 V8 V9 V10 V11 V13 V14 V15 V16 V17 V18 V19 V22 V23 V24 V26 V27 V52 V55 V56 V58 V59 V64 V65 V67">
         <labl>
            Caract&#233;ristiques du logement
         </labl>
      </varGrp>
      <var ID="V4" name="AEMM" files="F1" intrvl="discrete">
         <location width="4"/>
         <labl>
            Ann&#233;e d'emm&#233;nagement dans le logement (d&#233;taill&#233;e)
         </labl>
         <catgry>
            <catValu>
               0000
            </catValu>
            <labl>
               Logement ordinaire inoccup&#233;
            </labl>
         </catgry>
      </var>
      EOT
    )
    expected = <<-EOT
    <div class="varGrp">
      <div class="labl">
        Caractéristiques du logement
      </div>
      <div class="var">
        <div class="labl">
          Année d'emmenagement dans le logement (détaillée)
          <div class="catgry">
            <span class="catValu">0000</span>
            <span class="labl">Logement ordinaire inoccupé</span>
          </div>
        </div>
      </div>
    </div>
    EOT
    expect(ddi2html(ddi)).to eq(bodyHtml(expected))
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
