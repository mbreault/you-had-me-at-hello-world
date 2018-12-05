import 'dart:io';
import 'dart:convert';

// 1.  HTTP GET example.com
// 2.  Regex title out of HTML
// 3.  Reverse string
// 4.  Write to a text file called output.txt
// 5.  Verify output.txt exists containing niamoD elpmaxE

// 1.  HTTP GET example.com
// Using code from https://dev.to/graphicbeacon/quick-tip-how-to-make-http-requests-dart-56dd
void main() async {
  var request = await HttpClient()
      .getUrl(Uri.parse('http://example.com')); // produces a request object
  var response = await request.close(); // sends the request

  // transforms the response
  await for (var contents in response.transform(Utf8Decoder())) {
    // 2.  Regex title out of HTML
    RegExp exp = new RegExp(r"<title>(.*?)</title>");
    Match match = exp.firstMatch(contents);
    String title = match.group(1);
    // 3.  Reverse string
    String reversed = title.split('').reversed.join('');
    print(reversed);

    // 4.  Write to a text file called output.txt
    final filename = 'output.txt';
    var file = new File(filename);
    var sink = file.openWrite();
    sink.write(reversed);
    // Close the IOSink to free system resources.
    sink.close();
  }
}
