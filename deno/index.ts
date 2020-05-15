// 1. Get
const url = Deno.args[0];
const res = await fetch(url);
const body = new TextDecoder("utf-8").decode(new Uint8Array(await res.arrayBuffer()));

// 2.  Regex
let regex =  new RegExp(/<title>(.*)<\/title>/g);
var matches = body.match(regex);
const title = RegExp.$1;

// 3. Reverse
const reverse = title.split('').reverse().join('') 

// 4. Write
let file = await Deno.open("output.txt",{ create: true, write: true})
await file.write(new TextEncoder().encode(reverse));
file.close()
