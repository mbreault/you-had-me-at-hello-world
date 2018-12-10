//
//  main.swift
//  hello
//
//  Created by Michael Breault on 12/9/18.
//  Copyright © 2018 Embersilk. All rights reserved.
//

import Foundation


//1.  HTTP GET example.com
//2.  Regex title out of HTML
//3.  Reverse string
//4.  Write to a text file called output.txt

//1.  HTTP GET example.com
let url = URL(string: "http://www.example.com")!

let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
    guard let data = data else { return }
    let html:String = String(data: data, encoding: .utf8)!

    //2.  Regex title out of HTML
    let regex = try? NSRegularExpression(pattern: "<title>(.*)</title>", options: .caseInsensitive)
    
    let match =  regex!.firstMatch(in: html, options: [], range:NSMakeRange(0, html.utf16.count))
    
    if let matchRange = Range(match!.range(at: 1), in: html) {
        let title = html[matchRange] // => "1"
        
        //3.  Reverse string
        let reversed = String(title.reversed())
        
        //4.  Write to a text file called output.txt
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
             try reversed.write(to: dir.appendingPathComponent("output.txt"), atomically: false, encoding: .utf8)
                print("Written to file.")
            }
            catch let error as Error {
                print(error.localizedDescription)
            }
        }
    }
    
    exit(EXIT_SUCCESS)
}

task.resume()

dispatchMain()
