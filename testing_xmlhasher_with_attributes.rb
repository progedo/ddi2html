require 'xmlhasher_with_attributes'

def dataDscr xml
  result = "<codeBook version=''>\n"
  result.concat "  <dataDscr>\n"
  result.concat xml
  result.concat "  </dataDscr>\n"
  result.concat "</codeBook>"
end

@ddi = dataDscr(<<-EOT
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
@ddi_two_var = dataDscr(<<-EOT
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
  <var ID="V5" name="AEMM" files="F1" intrvl="discrete">
     <location width="4"/>
     <labl>
        Label V5
     </labl>
     <catgry>
        <catValu>
           0005
        </catValu>
        <labl>
           Logement V5
        </labl>
     </catgry>
     <catgry>
        <catValu>
           0015
        </catValu>
        <labl>
           Logement V5 2
        </labl>
     </catgry>
  </var>
  EOT
)
@ddi_two_varGrp = dataDscr(<<-EOT
  <varGrp ID="VG2" type="subject" var="V4 V5 V7 V8 V9 V10 V11 V13 V14 V15 V16 V17 V18 V19 V22 V23 V24 V26 V27 V52 V55 V56 V58 V59 V64 V65 V67">
     <labl>
        Caract&#233;ristiques du logement
     </labl>
  </varGrp>
  <varGrp ID="VG3" type="subject" var="V21 V25 V1 V60 V28 V29 V31 V61 V53">
     <labl>
        Activit&#233; professionnelle et formation
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
@xml = XmlHasher.parse(@ddi)
@xml_two_varGrp = XmlHasher.parse(@ddi_two_varGrp)
@xml_two_var = XmlHasher.parse(@ddi_two_var)
p '@xml[:codeBook][:dataDscr][:varGrp][:var].split.each {|c| p c}'
p @xml[:codeBook][:dataDscr][:varGrp][:var].split.each {|c| p c}
p '@xml[:codeBook][:dataDscr][:var][:ID]'
#p @xml[:codeBook][:dataDscr][:var][:ID]
p @xml[:codeBook][:dataDscr][:var].class
#@xml[:codeBook][:dataDscr][:varGrp][:var].split.each {|c| @xml[:codeBook][:dataDscr][:var].each { |v| p "#{v[:labl]} #{v[:catgry][:labl]}" if v[:ID] == c} }
# @xml[:codeBook][:dataDscr][:varGrp][:var].split.select {|c| c[:ID] == 'V4' }
@var_to_find = @xml[:codeBook][:dataDscr][:varGrp][:var].split.first 
# p @xml[:codeBook][:dataDscr][:var].select {|v| v[:ID] == var_to_find }

@vars_to_display = @xml_two_varGrp[:codeBook][:dataDscr][:varGrp].map {|v| v[:ID]}

p "#################################"
@xml_two_varGrp[:codeBook][:dataDscr][:varGrp].each do |g|
  vars = g[:var].split
  id = g[:ID]
  p "----------------------------"
  p id
  p vars

  var_in_var = @xml_two_var[:codeBook][:dataDscr][:var].select do |v|
    vars.include? v[:ID]
  end
  p var_in_var.map {|v| v[:catgry]}
end

