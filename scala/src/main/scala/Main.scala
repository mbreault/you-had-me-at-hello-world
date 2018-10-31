/*
1. HTTP GET example.com
2. Regex title out of HTML
3. Reverse string
4. Write to a text file.
*/

import scalaj.http._
import scala.util.matching.Regex
import java.io._

object Main extends App {
  
  // 1. HTTP GET example.com
  val response: HttpResponse[String] = Http("http://example.com").asString
  val body = response.body

  body.replace('\r', ' ')

  // 2. Regex title out of HTML
  val regexTitlePattern = "<title>(.*)</title>".r
  val someTitle = for (m <- regexTitlePattern.findFirstMatchIn(body)) yield m.group(1)
  val title = someTitle.get
  println(title)


  // 3. Reverse string

  val reverseTitle = title.reverse
  println(reverseTitle)

  // 4. Print to a file
  // Apparently scala doesn't have file i/o (that seems odd).  Everything online says to use Java
  new PrintWriter("output.txt") { write(reverseTitle); close }
}