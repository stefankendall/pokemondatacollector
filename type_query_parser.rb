require 'xmlsimple'
class TypeQueryParser
  def get_types(xml_data)
    data_object = XmlSimple.xml_in(xml_data)
    type_pod = data_object['pod'].select {|p| p['title'] == 'Result'}[0]
    types_from_text type_pod['subpod'][0]['plaintext'][0]
  end

  def types_from_text(text)
    text.gsub(/\s+/,'').split('|')
  end
end