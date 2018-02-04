# 1. HTTP GET example.com
# 2. Regex title out of HTML
# 3. Reverse string
# 4. Write to a text file.

# 1. HTTP GET example.com
s = urlread ("http://example.com");

# 2. Regex title out of HTML
[tokens,matches] = regexp(s,"<title>(.*)</title>",'tokens', 'match');

# 3. Reverse string
title = flip(tokens{1}{1});

# 4. Write to a text file.
fid = fopen('output.txt', 'w+');
fprintf(fid,"%s\n",title);
fclose(fid);

