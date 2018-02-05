class GroovyApp {
    // 1. HTTP GET example.com
    // 2. Regex title out of HTML
    // 3. Reverse string
    // 4. Write to a text file.

    void main() {
        // 1. HTTP GET example.com
        def response = new URL("http://example.com").text

        // 2. Regex title out of HTML
        def title
        def matcher = (response =~ /<title>(.*)</)
        if (matcher.find()) {
            title = matcher.group(1)
        }

        // 3. Reverse string
        title = title.reverse()

        // 4. Write to a text file
        def file = new File('output.txt')
        file.write(title)
    }
}

