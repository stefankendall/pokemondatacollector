require 'net/http'
class PokemonQuery
   def query(name)
     url = "http://api.wolframalpha.com/v2/query?input=Pokemon%20#{name}%20type&appid=VU42JJ-UPA6RRWAU8"
     puts url
     Net::HTTP.get_response(URI.parse(url)).body
   end
end