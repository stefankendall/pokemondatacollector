require 'xmlsimple'
class BaseStatsQueryParser
  def get_base_stats(xml_data)
    data_object = XmlSimple.xml_in(xml_data)
    result_pod = data_object['pod'].select { |p| p['title'] == 'Result' }[0]
    stats_from_text result_pod['subpod'][0]['plaintext'][0]
  end

  def stats_from_text(text)
    #hit points | 78 attack | 84 defense | 78 special attack | 109 special defense | 85 speed | 100
    hp = text.match(/hit points \| (\d+)/).captures[0]
    attack = text.match(/attack \| (\d+)/).captures[0]
    defense = text.match(/defense \| (\d+)/).captures[0]
    special_attack = text.match(/special attack \| (\d+)/).captures[0]
    special_defense = text.match(/special defense \| (\d+)/).captures[0]
    speed = text.match(/speed \| (\d+)/).captures[0]
    {:hp => Integer(hp),
     :attack => Integer(attack),
     :defense => Integer(defense),
     :special_attack => Integer(special_attack),
     :special_defense => Integer(special_defense),
     :speed => Integer(speed)}
  end
end