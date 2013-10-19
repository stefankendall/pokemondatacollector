class PokemonQuery
   def query(name)
     url = "http://api.wolframalpha.com/v2/query?input=#{name}&appid=VU42JJ-UPA6RRWAU8"
     puts url
     File.read("samples/muk.xml")
   end
end