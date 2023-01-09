use regex::Regex;
use std::error::Error;
use std::fs;

fn extract_title(html: &str) -> Result<String, Box<dyn Error>> {
    // Create a regular expression to match the title element of an HTML document
    let title_regex = Regex::new(r"<title>(.*?)</title>")?;

    // Use the `captures` method of the `Regex` struct to extract the contents of the title element
    let title = match title_regex.captures(html) {
        Some(captures) => captures.get(1).map(|m| m.as_str()).unwrap_or("").to_owned(),
        None => "".to_owned(),
    };

    Ok(title)
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {

    // Step 1 GET example.com
    let resp = reqwest::get("https://www.example.com").await?;
    let body = resp.text().await?;

    // Step 2 Regex to extract title
    let title = extract_title(&body).unwrap();
    println!("The title of the HTML document is: {}", title);

    // Step 3 Reverse the title
    let reversed_title: String = title.chars().rev().collect();
    println!("The reversed title of the HTML document is: {}", reversed_title);

    // Step 4 Write the reversed title to a file
    fs::write("output.txt", &reversed_title)?;

    // Step 5 Read the file back and compare it to the original title
    let contents = fs::read_to_string("output.txt")?;

    assert_eq!(contents.to_string(), reversed_title);

    Ok(())
}
