# 1. HTTP GET example.com
# 2. Regex title out of HTML
# 3. Reverse string
# 4. Write to a text file.

import requests
import re

# 1. HTTP GET example.com
r = requests.get('http://example.com')

# 2. Regex title out of HTML
title = re.findall("<title>(.*?)</title>", r.text)[0]

# 3. Reverse string
title = title[::-1]

# 4. Write to a text file.
with open('output.txt','w') as f:
    f.write(title)
f.closed