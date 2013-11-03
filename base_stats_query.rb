require 'net/http'
class BaseStatsQuery
   def query(name)
     url = "http://api.wolframalpha.com/v2/query?input=stats%20of%20pokemon%20#{URI.escape(name)}&appid=VU42JJ-UPA6RRWAU8"
     puts url
     Net::HTTP.get_response(URI.parse(url)).body
     #File.read("samples/charizard-base-stats.xml")
   end
end