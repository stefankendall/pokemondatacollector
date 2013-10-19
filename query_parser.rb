require 'xmlsimple'
class QueryParser
  def get_types(xml_data)
    data_object = XmlSimple.xml_in(xml_data)
    subpod = data_object['pod'][1]['subpod'][0]
    types_from_text subpod['plaintext'][0]
  end

  def types_from_text(text)
    type_line = text.split(/\n/).select { |t| t.include? 'type'}[0]
    types_string = type_line.gsub(/type\s+\|/,'').gsub(/\s+/,'')
    types_string.split('|')
  end
end