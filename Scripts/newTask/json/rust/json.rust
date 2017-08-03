#![feature(rustc_private)]

extern crate rustc_serialize;
use rustc_serialize::json;

#[derive(RustcDecodable, RustcEncodable)]
pub struct TestStruct  {
    foo: u8,
    bar: Vec<String>,
}

fn main() {

    for  i in 0..10000000 {
    let object = TestStruct {
        foo: 1,
        bar: vec!["10".to_string(),"apples".to_string()],
    };

    // Serialize using `json::encode`
    let encoded = json::encode(&object).unwrap();
    }

}
