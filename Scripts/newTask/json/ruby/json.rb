require 'json'

for i in 0..10000000
ruby_obj = JSON.parse('{"blue": [1, 2], "ocean": "water"}')
#puts ruby_obj

ruby_obj["ocean"] = { "water" => ["fishy", "salty"] }
#puts JSON.generate(ruby_obj)
#puts JSON.pretty_generate(ruby_obj)
JSON.generate(ruby_obj)
JSON.pretty_generate(ruby_obj)

end
