package main

// 1. HTTP GET example.com
// 2. Regex title out of HTML
// 3. Reverse string
// 4. Write to a text file.

import (
	"io/ioutil"
	"net/http"
	"regexp"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

// Reverse from https://coderwall.com/p/fw6miw/reverse-text-in-golang
func Reverse(s string) string {
	var reverse string
	for i := len(s) - 1; i >= 0; i-- {
		reverse += string(s[i])
	}
	return reverse
}

func main() {

	// 1. HTTP GET example.com
	resp, err := http.Get("http://example.com/")
	check(err)

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	check(err)

	response := string(body)

	// 2. Regex title out of HTML
	re, err := regexp.Compile(`<title>(.*)</title>`) // want to know what is in front of 'at'
	check(err)
	m := re.FindStringSubmatch(response)
	title := m[1]

	// 3. Reverse string
	title = Reverse(title)

	// 4. Write to a text file
	err = ioutil.WriteFile("output.txt", []byte(title), 0644)
	check(err)
}
