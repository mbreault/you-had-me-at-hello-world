extern crate futures;
extern crate hyper;
extern crate tokio_core;

use std::io::{self, Write};
use futures::{Future, Stream};
use hyper::Client;
use tokio_core::reactor::Core;
use std::error::Error;

fn step1() -> Result<String, Box<Error>> {
    let mut core = Core::new()?;
    let client = Client::new(&core.handle());
    let uri = "http://example.com".parse()?;
    let work = client.get(uri).and_then(|res| {
        println!("Response: {}", res.status());

        res.body().for_each(|chunk| {
            io::stdout()
                .write_all(&chunk)
                .map_err(From::from)
        })
    });
    core.run(work)?;

    Ok("Done".into())
}
fn main() {
    match step1() {
        Ok(s) => println!("Ok {}", s),
        Err(e) => println!("Error: {}", e.to_string()),
     }

}