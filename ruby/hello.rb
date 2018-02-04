#!/usr/bin/ruby

# 1. HTTP GET example.com
# 2. Regex title out of HTML
# 3. Reverse string
# 4. Write to a text file.

require 'net/http'

# 1. HTTP GET example.com
response = Net::HTTP.get('example.com', '/index.html') 

# 2. Regex title out of HTML
title = /<title>(.*)<(.*)\n/.match(response)[1]

# 3. Reverse string
title.reverse! 

# 4. Write to a text file.
f = File.new("output.txt", "w")
f.write(title)     #=> 10
f.close
